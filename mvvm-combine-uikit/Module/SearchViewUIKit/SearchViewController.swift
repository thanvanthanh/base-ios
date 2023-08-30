//
//  SearchViewController.swift
//  base-combine
//
//  Created by Thân Văn Thanh on 30/08/2023.
//

import UIKit
import Combine

final class SearchViewController: BaseViewController {
    
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var tableView: UITableView!
    
    private let searchTrigger = PassthroughSubject<String, Never>()
    private let selectUserTrigger = PassthroughSubject<IndexPath, Never>()
    
    var data: ItemSearchResponse? {
        didSet {
            tableView.reloadData()
        }
    }
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }
    
    override func setupUI() {
        super.setupUI()
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cell: SearchTableViewCell.self)
    }
    
    override func bindViewModel() {
        super.bindViewModel()
        guard let viewmodel = viewModel as? SearchViewModel else { return }
        
        let input = SearchViewModel.Input(
            searchTrigger: searchTrigger
                .throttle(for: 0.5, scheduler: RunLoop.main, latest: true)
                .eraseToAnyPublisher(),
            selectUserTrigger: selectUserTrigger.eraseToAnyPublisher()
        )
        
        let output = viewmodel.transform(input, disposeBag)
        output.$response
            .subscribe(repoSubscriber)
        
        output.$isLoading
            .subscribe(loadingSubscriber)
    }
}

extension SearchViewController {
    private var repoSubscriber: Binder<ItemSearchResponse?> {
        Binder(self) { vc, repos in
            self.data = repos
        }
    }
    
    private var loadingSubscriber: Binder<Bool> {
        Binder(self) { vc, isLoading in
            DispatchQueue.main.async {
                self.handleActivityIndicator(state: isLoading)
            }
        }
    }
}

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        searchBar.endEditing(true)
        selectUserTrigger.send(indexPath)
    }
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(cell: SearchTableViewCell.self, indexPath: indexPath)
        cell.config(data: data?.items?[indexPath.row])
        return cell
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchTrigger.send(searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchTrigger.send("")
    }
}
