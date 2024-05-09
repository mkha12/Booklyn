//
//  BookCell.swift
//  Booklyn
//
//  Created by MARIIA on 02.05.24.
//

import UIKit

final class BookCell: UICollectionViewCell {
    static let reuseIdentifier = "cell"
    
    private var cellImage: UIImageView!
    private var titleLabel: UILabel!
    private var authorLabel: UILabel!
    private var readButton: UIButton!
    var cardView: UIView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        cellImage = UIImageView()
        cellImage.contentMode = .scaleAspectFill
        cellImage.clipsToBounds = true
        cellImage.translatesAutoresizingMaskIntoConstraints = false
        cellImage.image = UIImage(named: "test_book")
        contentView.addSubview(cellImage)
        
        readButton = UIButton(type: .custom)
        readButton.setTitle("+", for: .normal)
        readButton.addTarget(self, action: #selector(didTapReadButton), for: .touchUpInside)
        readButton.layer.cornerRadius = 20
        readButton.backgroundColor = .white
        readButton.setTitleColor(.black, for: .normal)
        readButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(readButton)
        
        NSLayoutConstraint.activate([
            cellImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cellImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            readButton.centerXAnchor.constraint(equalTo: cellImage.centerXAnchor),
            readButton.bottomAnchor.constraint(equalTo: cellImage.bottomAnchor, constant: -10),
            readButton.widthAnchor.constraint(equalToConstant: 30),
            readButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        }
        
        @objc private func didTapReadButton() {
            if readButton.title(for: .normal) == "+" {
                    readButton.setTitle("✓", for: .normal)
                } else {
                    readButton.setTitle("+", for: .normal)
                }
        }
    
    func showCompletedState() {
        readButton.setTitle("✓", for: .normal)
    }
    
    func showNotCompletedState() {
        readButton.setTitle("+", for: .normal)
    }
    }

