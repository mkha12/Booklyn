//
//  ViewController.swift
//  Booklyn
//
//  Created by MARIIA on 24.04.24.

import UIKit
import Shuffle_iOS

final class BooksViewController: UIViewController {
    
    private var swipeCardStack: SwipeCardStack!
    private let bookData = [
        ["image": "test_book", "author": "Макс Фрай", "title": "Наваждения", "description": "В пятой части популярного фантастического цикла «Лабиринты Ехо» сэр Макс поведает читателю о том, как он и его друзья справлялись с волшебными наваждениями."],
        ["image": "test_book1", "author": "Энн Пэтчет", "title": "Голландский дом", "description": "Описание книги 2."],
        ["image": "test_book2", "author": "Celeste Ng", "title": "Our Missing Hearts", "description": "Описание книги 3."],
        ["image": "test_book3", "author": "Джонатан Франзен", "title": "Перекрестки", "description": "Описание книги 4."],
        ["image": "test_book4", "author": "Стивен Чбоски", "title": "Хорошо быть тихоней", "description": "Описание книги 5."]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSwipeCardStack()
    }
    
    func setupSwipeCardStack() {
        swipeCardStack = SwipeCardStack()
        swipeCardStack.delegate = self
        swipeCardStack.dataSource = self
        swipeCardStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(swipeCardStack)
        
        NSLayoutConstraint.activate([
            swipeCardStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            swipeCardStack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            swipeCardStack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            swipeCardStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

// MARK: - SwipeCardStackDataSource
extension BooksViewController: SwipeCardStackDataSource {
    func numberOfCards(in cardStack: SwipeCardStack) -> Int {
        return bookData.count
    }

    func cardStack(_ cardStack: SwipeCardStack, cardForIndexAt index: Int) -> SwipeCard {
        let card = SwipeCard()
        card.backgroundColor = .white
        let book = bookData[index]
    
        let imageView = UIImageView(image: UIImage(named: book["image"]!))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        card.addSubview(imageView)
        
        let authorNameLabel = UILabel()
        authorNameLabel.text = book["author"]
        authorNameLabel.textColor = .black
        authorNameLabel.font = .systemFont(ofSize: 25, weight: .medium)
        authorNameLabel.translatesAutoresizingMaskIntoConstraints = false
        card.addSubview(authorNameLabel)
        
        let bookNameLabel = UILabel()
        bookNameLabel.text = book["title"]
        bookNameLabel.textColor = .black
        bookNameLabel.font = .systemFont(ofSize: 35, weight: .medium)
        bookNameLabel.translatesAutoresizingMaskIntoConstraints = false
        card.addSubview(bookNameLabel)
        
        let descripBooksLabel = UILabel()
        descripBooksLabel.text = "Описание"
        descripBooksLabel.textColor = .black
        descripBooksLabel.font = .systemFont(ofSize: 20, weight: .medium)
        descripBooksLabel.translatesAutoresizingMaskIntoConstraints = false
        card.addSubview(descripBooksLabel)
        
        let descripTextLabel = UILabel()
        descripTextLabel.text = book["description"]
        descripTextLabel.textColor = .black
        descripTextLabel.font = .systemFont(ofSize: 18)
        descripTextLabel.numberOfLines = 0
        descripTextLabel.lineBreakMode = .byWordWrapping
        descripTextLabel.translatesAutoresizingMaskIntoConstraints = false
        card.addSubview(descripTextLabel)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: card.topAnchor, constant: 20),
            imageView.centerXAnchor.constraint(equalTo: card.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 300),
            imageView.heightAnchor.constraint(equalToConstant: 400),
            
            authorNameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            authorNameLabel.centerXAnchor.constraint(equalTo: card.centerXAnchor),
            
            bookNameLabel.topAnchor.constraint(equalTo: authorNameLabel.bottomAnchor, constant: 5),
            bookNameLabel.centerXAnchor.constraint(equalTo: card.centerXAnchor),
            
            descripBooksLabel.topAnchor.constraint(equalTo: bookNameLabel.bottomAnchor, constant: 10),
            descripBooksLabel.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 20),
            
            descripTextLabel.topAnchor.constraint(equalTo: descripBooksLabel.bottomAnchor, constant: 10),
            descripTextLabel.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 20),
            descripTextLabel.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -20),
            descripTextLabel.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -20)
        ])
        
        return card
    }
}

// MARK: - SwipeCardStackDelegate
extension BooksViewController: SwipeCardStackDelegate {
    func cardStack(_ cardStack: SwipeCardStack, didSwipeCardAt index: Int, with direction: SwipeDirection) {
        // Handle swipe directions
        if direction == .right {
            print("Swiped right")
        } else if direction == .left {
            print("Swiped left")
        }
    }
}

