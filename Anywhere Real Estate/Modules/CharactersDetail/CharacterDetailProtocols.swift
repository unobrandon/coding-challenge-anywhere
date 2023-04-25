//
//  CharacterDetailProtocols.swift
//  Anywhere Real Estate
//
//  Created by Brandon Shaw on 4/23/23.
//

import UIKit

protocol CharacterDetailViewProtocol: AnyObject {
    var presenter: CharacterDetailPresenterProtocol? { get set }
    
    func showCharacterDetails(_ character: Character)
	func updateImage(_ image: UIImage)
}

protocol CharacterDetailInteractorProtocol: AnyObject {
	var presenter: CharacterDetailInteractorOutputProtocol? { get set }

	func downloadImage(_ urlString: String)
}


protocol CharacterDetailPresenterProtocol: AnyObject {
    var view: CharacterDetailViewProtocol? { get set }
    var interactor: CharacterDetailInteractorProtocol? { get set }

    func viewDidLoad()
	func downloadImage(_ urlString: String)
}

protocol CharacterDetailRouterProtocol: AnyObject {
    static func createCharacterDetailModule(with character: Character?) -> UIViewController
}

// MARK: Output Protocol

protocol CharacterDetailInteractorOutputProtocol: AnyObject {
	func didDownloadImage(_ image: UIImage)
	func onError(_ error: Error)
}
