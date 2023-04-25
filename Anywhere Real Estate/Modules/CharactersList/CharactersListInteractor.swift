//
//  CharactersListInteractor.swift
//  Anywhere Real Estate
//
//  Created by Brandon Shaw on 4/23/23.
//

import UIKit

class CharactersListInteractor: CharactersListInteractorProtocol {
    weak var presenter: CharactersListInteractorOutputProtocol?

    func fetchCharacters(query: String) {
		NetworkManager.shared.fetchCharacters(query: query, completion: { result in
			switch result {
			case .success(let characters):
				self.presenter?.didRetrieveCharacters(characters)
			case .failure(let error):
				self.presenter?.onError(error)
			}
		})
    }
}
