//
//  ViewController.swift
//  Booklyn
//
//  Created by MARIIA on 24.04.24.

import UIKit
import Shuffle_iOS

protocol BooksViewControllerDelegate: AnyObject {
    func didAddBookToFavorites(_ book: [String: String])
}

final class BooksViewController: UIViewController {
    
    private var swipeCardStack: SwipeCardStack!
    private var leftArrowImageView: UIImageView!
    private var rightArrowImageView: UIImageView!
    
    let bookData = [
        ["image": "test_book", "author": "Макс Фрай", "title": "Наваждения", "description": "В пятой части популярного фантастического цикла «Лабиринты Ехо» сэр Макс поведает читателю о том, как он и его друзья справлялись с волшебными наваждениями."],
        ["image": "test_book1", "author": "Энн Пэтчет", "title": "Голландский дом", "description": "Эта книга рассказывает о доме, который становится центром вселенной для своих обитателей, и о семье, чья жизнь оказывается неразрывно связана с этим местом."],
        ["image": "test_book2", "author": "Celeste Ng", "title": "Our Missing Hearts", "description": "Роман, исследующий сложности и борьбу семейных отношений в современном обществе."],
        ["image": "test_book3", "author": "Джонатан Франзен", "title": "Перекрестки", "description": "Роман о сложных переплетениях судьбы и человеческих отношений в Америке середины 20 века."],
        ["image": "test_book4", "author": "Стивен Чбоски", "title": "Хорошо быть тихоней", "description": "Эмоциональная и глубокая история о взрослении и преодолении личных трудностей."],
        ["image": "test_book5", "author": "А.С. Байетт", "title": "Дева в саду", "description": "Роман, исследующий жизнь и творческие стремления молодой женщины в послевоенной Англии."],
        ["image": "test_book6", "author": "Лиана Мориарти", "title": "Яблоки никогда не падают", "description": "История о семейных тайнах и разногласиях, которые всплывают на поверхность после исчезновения матери."],
        ["image": "test_book7", "author": "Тинатин Мжвадназе", "title": "Лето, бабушка и я", "description": "Трогательный рассказ о детстве, воспоминаниях и семейных ценностях."],
        ["image": "test_book8", "author": "Франческа Рис", "title": "Наблюдатель", "description": "«Писатель ищет помощника» — такое объявление видит в газете Лия, молодая англичанка, сбежавшая в Париж от серых лондонских будней."],
        ["image": "test_book9", "author": "Алексей Иванов", "title": "Пищеблок", "description": "Мистический триллер о загадочных событиях, происходящих в пионерлагере на фоне перестройки в СССР."]
    ]

    weak var delegate: BooksViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSwipeCardStack()
        setupArrows()
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
    func setupArrows() {
        leftArrowImageView = UIImageView(image: UIImage(systemName: "arrow.left.circle"))
        leftArrowImageView.tintColor = .red
        leftArrowImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(leftArrowImageView)
        
        rightArrowImageView = UIImageView(image: UIImage(systemName: "arrow.right.circle"))
        rightArrowImageView.tintColor = .green
        rightArrowImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(rightArrowImageView)
        
        NSLayoutConstraint.activate([
            leftArrowImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            leftArrowImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            leftArrowImageView.widthAnchor.constraint(equalToConstant: 40),
            leftArrowImageView.heightAnchor.constraint(equalToConstant: 40),
            
            rightArrowImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            rightArrowImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            rightArrowImageView.widthAnchor.constraint(equalToConstant: 40),
            rightArrowImageView.heightAnchor.constraint(equalToConstant: 40)
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
        if direction == .right {
            let book = bookData[index]
            print("Attempting to add book to favorites: \(book)")  // Дополнительный отладочный вывод
            delegate?.didAddBookToFavorites(book)
            print("Swiped right: \(book["title"] ?? "")")
        } else if direction == .left {
            print("Swiped left: \(bookData[index]["title"] ?? "")")
        }
    }
}



