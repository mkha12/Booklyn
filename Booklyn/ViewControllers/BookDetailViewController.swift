//
//  BookDetailViewController.swift
//  Booklyn
//
//  Created by MARIIA on 09.05.24.
//

import UIKit

final class BookDetailViewController: UIViewController {
    
    private var imageView: UIImageView!
    private var authorLabel: UILabel!
    private var titleLabel: UILabel!
    private var descriptionLabel: UILabel!
    private var closeButton: UIButton!
    
    var book: [String: String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        setupConstraints()
        configureView()
        configureCloseButton()
    }
    
    private func setupUI() {
        imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        authorLabel = UILabel()
        authorLabel.font = .systemFont(ofSize: 20, weight: .medium)
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(authorLabel)
        
        titleLabel = UILabel()
        titleLabel.font = .systemFont(ofSize: 25, weight: .bold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        descriptionLabel = UILabel()
        descriptionLabel.font = .systemFont(ofSize: 18)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(descriptionLabel)
        
        closeButton = UIButton(type: .system)
        closeButton.setTitle("Close", for: .normal)
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(closeButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 300),
            
            authorLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            authorLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            closeButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            closeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func configureView() {
        guard let book = book else { return }
        imageView.image = UIImage(named: book["image"]!)
        authorLabel.text = book["author"]
        titleLabel.text = book["title"]
        descriptionLabel.text = book["description"]
    }
    
    private func configureCloseButton() {
        self.modalPresentationStyle = .pageSheet
        self.isModalInPresentation = false
    }
    
    @objc private func closeButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
}

