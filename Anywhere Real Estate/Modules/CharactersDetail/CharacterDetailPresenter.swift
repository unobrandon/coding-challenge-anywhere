//
//  CharacterDetailPresenter.swift
//  Anywhere Real Estate
//
//  Created by Brandon Shaw on 4/23/23.
//

import UIKit

class CharacterDetailPresenter: CharacterDetailPresenterProtocol, CharacterDetailInteractorOutputProtocol {
	var interactor: CharacterDetailInteractorProtocol?
	weak var view: CharacterDetailViewProtocol?
    private let character: Character

    init(character: Character) {
        self.character = character
    }

    func viewDidLoad() {
        view?.showCharacterDetails(character)
	
		#warning("Temporary image hardcoded due to invalid API response.")
		// I acknowledge that the following does not follow the requirements but
		// due to an invalid API response I am using a temporary example image.
		// If a proper icon URL were available, the function would call downloadImage(character.iconUrl) instead.

		// let tempErrorUrlString = "https://www.indiewire.com/wp-content/uploads/2023/03/c6c46159dfgddaf44de5519afbf563ab9e6f.jpeg"
		let tempUrlString = "https://www.indiewire.com/wp-content/uploads/2023/03/c6c46159daf44de5519afbf563ab9e6f.jpeg"
		downloadImage(tempUrlString)
    }

	func downloadImage(_ url: String) {
		interactor?.downloadImage(url)
	}

	func didDownloadImage(_ image: UIImage) {
		view?.updateImage(image)
	}

	func onError(_ error: Error) {
		print("Error downloading image: \(error.localizedDescription)")
		
		if let placeholder = UIImage(named: "placeholder") {
			view?.updateImage(placeholder)
		}
	}
}
