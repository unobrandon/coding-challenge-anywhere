//
//  CharacterDetailRouter.swift
//  Anywhere Real Estate
//
//  Created by Brandon Shaw on 4/23/23.
//

import UIKit

class CharacterDetailRouter: CharacterDetailRouterProtocol {
	
	static func createCharacterDetailModule(with character: Character?) -> UIViewController {
		if let character = character {
			let view = CharacterDetailViewController()
			let presenter: CharacterDetailPresenterProtocol & CharacterDetailInteractorOutputProtocol = CharacterDetailPresenter(character: character)
			let interactor: CharacterDetailInteractorProtocol = CharacterDetailInteractor()
			
			view.presenter = presenter
			presenter.view = view
			presenter.interactor = interactor
			interactor.presenter = presenter
			
			return view
		} else {
			return createEmptyView()
		}
	}

	private static func createEmptyView() -> UIViewController {
		let emptyViewController = UIViewController()
		let emptyView = UIView()
		let label = UILabel()
		label.text = "No data selected"
		label.translatesAutoresizingMaskIntoConstraints = false
		emptyView.addSubview(label)
		
		NSLayoutConstraint.activate([
			label.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor),
			label.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor)
		])
		
		emptyViewController.view = emptyView
		
		return emptyViewController
	}
}
