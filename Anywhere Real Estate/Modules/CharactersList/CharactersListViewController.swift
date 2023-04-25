//
//  CharactersListViewController.swift
//  Anywhere Real Estate
//
//  Created by Brandon Shaw on 4/23/23.
//

import UIKit

class CharactersListViewController: UITableViewController, CharactersListViewProtocol {
    var presenter: CharactersListPresenterProtocol?
    
    var characters: [Character] = []
    var filteredCharacters: [Character] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = Bundle.main.infoDictionary?["DISPLAY_NAME"] as? String ?? "Characters"

		setupTableView()
        presenter?.viewDidLoad()
    }

	private func setupTableView() {
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "characterCell")
		setupSearchController()
	}

	private func setupSearchController() {
		let searchController = UISearchController(searchResultsController: nil)
		searchController.searchResultsUpdater = self
		searchController.obscuresBackgroundDuringPresentation = false
		searchController.searchBar.placeholder = "Search Characters"
		
		navigationItem.searchController = searchController
		navigationItem.hidesSearchBarWhenScrolling = true
		
		definesPresentationContext = true
	}

	func showCharacters(_ characters: [Character]) {
		self.characters = characters
		self.filteredCharacters = characters
		
		DispatchQueue.main.async {
			self.tableView.reloadData()
		}
	}
}

// MARK: Table View Delegate

extension CharactersListViewController {
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return filteredCharacters.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath)
		let character = filteredCharacters[indexPath.row]
		cell.accessoryType = .disclosureIndicator
		cell.textLabel?.text = character.name
		return cell
	}

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		let character = filteredCharacters[indexPath.row]
		presenter?.didSelectCharacter(character)
	}
}


// MARK: Search Delegate

extension CharactersListViewController: UISearchResultsUpdating {
	func updateSearchResults(for searchController: UISearchController) {
		guard let searchText = searchController.searchBar.text, !searchText.isEmpty else {
			filteredCharacters = characters
			tableView.reloadData()
			return
		}
		
		filteredCharacters = characters.filter { character in
			character.name.lowercased().contains(searchText.lowercased()) ||
			character.normalizedName.lowercased().contains(searchText.lowercased())
		}
		
		tableView.reloadData()
	}
}
