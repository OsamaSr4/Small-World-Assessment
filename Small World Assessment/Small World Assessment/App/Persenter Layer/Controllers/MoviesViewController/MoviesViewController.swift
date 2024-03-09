//
//  ViewController.swift
//  Small World Assessment
//
//  Created by MacBook Pro on 09/03/2024.
//

import UIKit

class MoviesViewController: UIViewController ,IdentifiableProtocol{

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: MovieVCViewModel?
    var coordinator: AppCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.registerCell()
        self.fetchData()
        self.setupSearchBar()
        self.title = "Movies"
    }
    
    func initilizeController(viewModel: MovieVCViewModel) {
        self.viewModel = viewModel
        self.viewModel?.delegate = self
    }

    private func fetchData() {
        viewModel?.getMoviesList()
    }
    
    private func registerCell(){
        tableView.registerCell(name: MoviesTableViewCell.name)
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    private func setupSearchBar(){
        searchBar.placeholder = "Search Movies"
        searchBar.delegate = self
        searchBar.showsCancelButton = true
    
    }
}

extension MoviesViewController : MoviesListVMDelegate , Alertable{
    
    func searchState(active: Bool) {
        if !active {
            searchBar.endEditing(active)
        }
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.tableView.reloadData()
        }
    }
    
    
    func sucessWhileFetchingData() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.tableView.reloadData()
        }
    }
    
    func show(error msg: String) {
        showAlert(message: msg)
    }
    
    func moveToDetails(withMovieId id: Int) {
        coordinator?.showMovieDetails(withMovieId: id)
    }
}

extension MoviesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.getUIModelsCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell : MoviesTableViewCell = tableView.dequeueReusableCell(withIdentifier: MoviesTableViewCell.getIdentifier(), for: indexPath) as? MoviesTableViewCell else {return UITableViewCell() }
        
        if let model = self.viewModel?.getUIModel(atIndex: indexPath.row) {
            cell.setupData(fromModel: model)
        }else{
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel?.didTapOnItem(atIndex: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
}

//MARK: - UISearchBar Delegate
extension MoviesViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel?.applySearch(with: searchText)
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        viewModel?.clearSearch()
    }
    
}

