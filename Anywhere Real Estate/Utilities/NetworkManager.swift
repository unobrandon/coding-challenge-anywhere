//
//  NetworkManager.swift
//  Anywhere Real Estate
//
//  Created by Brandon Shaw on 4/23/23.
//

import UIKit

class NetworkManager {
    static let shared = NetworkManager()

	func fetchCharacters(query: String, completion: @escaping (Result<[Character], Error>) -> Void) {
		#warning("Temporary API hardcoded due to invalid API response.")
		// I acknowledge that the following does not follow the requirements but
		// due to an invalid API response I am using a temporary example api.
		// If I were to use the proper API, the url would be:
		// let urlProjectString = "https://api.duckduckgo.com/?q=\(query)+characters&format=json"

		let tempUrlString = "https://api.sampleapis.com/simpsons/characters"
		let encodedUrl = tempUrlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)

		guard let url = URL(string: encodedUrl!) else {
			return completion(.failure(NSError(domain: Bundle.main.bundleIdentifier ?? "", code: 1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
		}
		
		URLSession.shared.dataTask(with: url) { (data, response, error) in
			if let error = error {
				print("Error fetching characters: \(error)")
				completion(.failure(error))
				return
			}
			
			guard let data = data else {
				completion(.failure(NSError(domain: Bundle.main.bundleIdentifier ?? "", code: 2, userInfo: [NSLocalizedDescriptionKey: "No data returned"])))
				return
			}
			
			do {
				let decoder = JSONDecoder()
				let characters = try decoder.decode([Character].self, from: data)
				completion(.success(characters))
			} catch {
				print("Error decoding characters: \(error)")
				completion(.failure(error))
			}
		}.resume()
	}

	func downloadImage(_ urlString: String, completion: @escaping (Result<UIImage, Error>) -> Void) {
		guard let url = URL(string: urlString) else {
			completion(.failure(NSError(domain: Bundle.main.bundleIdentifier ?? "", code: 1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
			return
		}
		
		URLSession.shared.dataTask(with: url) { (data, response, error) in
			if let error = error {
				print("Error downloading image: \(error)")
				completion(.failure(error))
				return
			}
			
			guard let data = data, let image = UIImage(data: data) else {
				completion(.failure(NSError(domain: Bundle.main.bundleIdentifier ?? "", code: 2, userInfo: [NSLocalizedDescriptionKey: "No image data returned"])))
				return
			}

			completion(.success(image))
		}.resume()
	}
}
