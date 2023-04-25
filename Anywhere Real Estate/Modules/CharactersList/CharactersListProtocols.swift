//
//  CharactersListProtocols.swift
//  Anywhere Real Estate
//
//  Created by Brandon Shaw on 4/23/23.
//

import UIKit

protocol CharactersListViewProtocol: AnyObject {
    var presenter: CharactersListPresenterProtocol? { get set }
    
    func showCharacters(_ characters: [Character])
}

protocol CharactersListInteractorProtocol: AnyObject {
    var presenter: CharactersListInteractorOutputProtocol? { get set }
    
    func fetchCharacters(query: String)
}

protocol CharactersListPresenterProtocol: AnyObject {
    var view: CharactersListViewProtocol? { get set }
    var interactor: CharactersListInteractorProtocol? { get set }
    var router: CharactersListRouterProtocol? { get set }
    
    func viewDidLoad()
    func didSelectCharacter(_ character: Character)
}

protocol CharactersListRouterProtocol: AnyObject {
    var view: CharactersListViewProtocol? { get set }
    
    static func createCharactersListModule() -> CharactersListViewController
    func showCharacterDetail(for character: Character)
}

// MARK: Output Protocol

protocol CharactersListInteractorOutputProtocol: AnyObject {
    func didRetrieveCharacters(_ characters: [Character])
    func onError(_ error: Error)
}
