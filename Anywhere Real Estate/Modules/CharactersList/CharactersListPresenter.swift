//
//  CharactersListPresenter.swift
//  Anywhere Real Estate
//
//  Created by Brandon Shaw on 4/23/23.
//

import UIKit

class CharactersListPresenter: CharactersListPresenterProtocol, CharactersListInteractorOutputProtocol {
    weak var view: CharactersListViewProtocol?
    var interactor: CharactersListInteractorProtocol?
    var router: CharactersListRouterProtocol?

    func viewDidLoad() {
		let query = Bundle.main.infoDictionary?["API_QUERY"] as? String ?? ""
        interactor?.fetchCharacters(query: query)
    }

    func didSelectCharacter(_ character: Character) {
        router?.showCharacterDetail(for: character)
    }
    
    func didRetrieveCharacters(_ characters: [Character]) {
		view?.showCharacters(characters)
    }
    
    func onError(_ error: Error) {
        print("did retrieve an error fetching characters:\n\(error.localizedDescription)")
    }
}
