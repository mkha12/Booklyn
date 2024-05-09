//
//  ProfileViewController.swift
//  Booklyn
//
//  Created by MARIIA on 27.04.24.
//

import UIKit


final class ProfileViewController: UIViewController, BooksViewControllerDelegate {
   
    private var profileImage: UIImageView!
    private var profileName: UILabel!
    private var profileId: UILabel!
    private var favoriteBooks: [[String: String]] = []
    var collectionView: UsersBookCollectionView!
    
    init(bookData: [[String: String]]) {
            super.init(nibName: nil, bundle: nil)
        }
    
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        setupConstraint()
        collectionView.bookData = favoriteBooks
        collectionView.parentViewController = self
        print("ProfileViewController loaded")
    }
    
    func setupUI() {
        
        profileImage = UIImageView()
        profileImage.image = UIImage(named: "test_photo")
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileImage)
        
        profileName = UILabel()
        profileName.text = ("Мария Алексеевна")
        profileName.textColor = .black
        profileName.font = .systemFont(ofSize: 20, weight: .medium)
        profileName.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileName)
        
        profileId = UILabel()
        profileId.text = ("id6457")
        profileId.textColor = .black
        profileId.font = .systemFont(ofSize: 10)
        profileId.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileId)
        
        collectionView = UsersBookCollectionView()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        
    }
    
    private func setupConstraint() {
        
        NSLayoutConstraint.activate([
            profileImage.heightAnchor.constraint(equalToConstant: 70),
            profileImage.widthAnchor.constraint(equalToConstant: 70),
            profileImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 76),
            profileImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            profileName.topAnchor.constraint(equalTo:profileImage.bottomAnchor,constant: 20),
            profileName.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            profileId.topAnchor.constraint(equalTo:profileName.bottomAnchor,constant: 10),
            profileId.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            collectionView.topAnchor.constraint(equalTo: profileId.bottomAnchor, constant: 20),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -16),
        ])
    }
    
    func didAddBookToFavorites(_ book: [String : String]) {
        favoriteBooks.append(book)
        collectionView.bookData = favoriteBooks
        collectionView.reloadData()
    }
    
}

//extension ProfileViewController: UICollectionViewDelegate {
//    func collectionView(_ collectionView: UICollectionView,
//                        contextMenuConfigurationForItemAt indexPath: IndexPath,
//                        point: CGPoint) -> UIContextMenuConfiguration? {
//        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { suggestedActions in
//            let removeAction = UIAction(title: "Remove",
//                                        image: nil,
//                                        identifier: nil,
//                                        discoverabilityTitle: nil,
//                                        attributes: .destructive,
//                                        handler: { [weak self] _ in
//                guard let self = self else { return }
//                self.deleteFromFavorites(indexPath: indexPath)
//            })
//
//            return UIMenu(title: "Edit",
//                          image: nil,
//                          options: [],
//                          children: [removeAction])
//        }
//    }
//
//
//    private func deleteFromFavorites(indexPath: IndexPath) {
//        favoriteBooks.remove(at: indexPath.item)
//        collectionView.bookData = favoriteBooks
//        collectionView.deleteItems(at: [indexPath])
//    }
//}

