//
//  CellBookHeader.swift
//  Booklyn
//
//  Created by MARIIA on 06.05.24.
//

import UIKit

final class CategoryHeader: UICollectionReusableView {
    static let reuseIdentifier = "CategoryHeader"
    
    var titleLabel: UILabel!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    
    func setupUI() {
        titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 19, weight: .bold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor), // Центрирование по горизонтали
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor), // Центрирование по вертикали
            titleLabel.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 16), // Отступ слева (не менее 16)
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -16) // Отступ справа (не менее 16)
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with title: String) {
        titleLabel.text = title
    }
}
