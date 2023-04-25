//
//  CharactersListRouter.swift
//  Anywhere Real Estate
//
//  Created by Brandon Shaw on 4/23/23.
//

import UIKit

class CharactersListRouter: CharactersListRouterProtocol {
    weak var view: CharactersListViewProtocol?
    
    static func createCharactersListModule() -> CharactersListViewController {
        let view = CharactersListViewController()
        let presenter: CharactersListPresenterProtocol & CharactersListInteractorOutputProtocol = CharactersListPresenter()
        let interactor: CharactersListInteractorProtocol = CharactersListInteractor()
        let router: CharactersListRouterProtocol = CharactersListRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.view = view
        
        return view
    }
	
	func showCharacterDetail(for character: Character) {
		guard let sourceView = view as? UIViewController else { return }

		let characterDetailViewController = CharacterDetailRouter.createCharacterDetailModule(with: character)
		sourceView.showDetailViewController(characterDetailViewController, sender: nil)
	}
}
