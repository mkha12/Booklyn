//
//  CollectionView.swift
//  Booklyn
//
//  Created by MARIIA on 02.05.24.
//
import UIKit

final class UsersBookCollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    var bookData: [[String: String]] = []
    weak var parentViewController: UIViewController?
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.headerReferenceSize = CGSize(width: 100, height: 50)
        super.init(frame: .zero, collectionViewLayout: layout)
        self.register(BookCell.self, forCellWithReuseIdentifier: BookCell.reuseIdentifier)
        self.register(CategoryHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CategoryHeader.reuseIdentifier)
        self.dataSource = self
        self.delegate = self
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bookData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BookCell.reuseIdentifier, for: indexPath) as! BookCell
        let book = bookData[indexPath.item]
        if let imageName = book["image"] {
            cell.configure(with: imageName)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let book = bookData[indexPath.item]
        let detailVC = BookDetailViewController()
        detailVC.book = book
        detailVC.modalPresentationStyle = .fullScreen
        parentViewController?.present(detailVC, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CategoryHeader.reuseIdentifier, for: indexPath) as? CategoryHeader else {
                fatalError("Unable to dequeue CategoryHeader")
            }
            header.configure(with: "My book")
            
            return header
        } else {
            return UICollectionReusableView()
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 32) / 2
        let height = width * 1.5
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
            return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { suggestedActions in
                let removeAction = UIAction(title: "Remove",
                                            image: nil,
                                            identifier: nil,
                                            discoverabilityTitle: nil,
                                            attributes: .destructive,
                                            handler: { [weak self] _ in
                    guard let self = self else { return }
                    self.deleteFromFavorites(indexPath: indexPath)
                })
                return UIMenu(title: "Edit",
                              image: nil,
                              options: [],
                              children: [removeAction])
            }
        }

        private func deleteFromFavorites(indexPath: IndexPath) {
            bookData.remove(at: indexPath.item)
            self.deleteItems(at: [indexPath])
            print("Book removed from favorites at index \(indexPath.item)")
        }
}
