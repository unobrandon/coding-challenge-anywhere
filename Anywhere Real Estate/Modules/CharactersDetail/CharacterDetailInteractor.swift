//
//  CharacterDetailInteractor.swift
//  Anywhere Real Estate
//
//  Created by Brandon Shaw on 4/23/23.
//

import UIKit

class CharacterDetailInteractor: CharacterDetailInteractorProtocol {
	weak var presenter: CharacterDetailInteractorOutputProtocol?

	func downloadImage(_ urlString: String) {
		NetworkManager.shared.downloadImage(urlString) { result in
			switch result {
			case .success(let image):
				self.presenter?.didDownloadImage(image)
			case .failure(let error):
				self.presenter?.onError(error)
			}
		}
	}
}
