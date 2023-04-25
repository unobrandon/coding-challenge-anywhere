//
//  CharacterDetailViewController.swift
//  Anywhere Real Estate
//
//  Created by Brandon Shaw on 4/23/23.
//

import UIKit

class CharacterDetailViewController: UIViewController, CharacterDetailViewProtocol {
    var presenter: CharacterDetailPresenterProtocol?
    
    private var imageView = UIImageView()
    private let titleLabel = UILabel()
    private let nameLabel = UILabel()
    private let descriptionLabel = UILabel()
    
	deinit {
		NotificationCenter.default.removeObserver(self)
	}

    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = UIColor.systemBackground

        presenter?.viewDidLoad()
    }

	func updateImage(_ image: UIImage) {
		DispatchQueue.main.async {
			self.imageView.image = image
		}
	}
    
    func showCharacterDetails(_ character: Character) {
		navigationItem.title = character.name

        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        titleLabel.textAlignment = .left
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        nameLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        nameLabel.textAlignment = .left
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        
        descriptionLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .left
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 40),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            nameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 40),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
		titleLabel.text = character.name
        nameLabel.text = character.normalizedName
        // descriptionLabel.text = character.description
    }
}
