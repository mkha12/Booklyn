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
    
    private var declinedBooks: [[String: String]] = []
    private var currentIndex = 0
    
    var favoriteBooks: [[String: String]] = []
    var rejectedBooks: [[String: String]] = []
    var unviewedBooks: [[String: String]] = []


    weak var delegate: BooksViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        view.backgroundColor = .white
        setupSwipeCardStack()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if isFirstTimeUser() {
            showInstructions()
        }
    }
    func showInstructions() {
        let alert1 = UIAlertController(title: "Инструкция 1", message: "Свайпните влево, если книга не заинтересовала.", preferredStyle: .alert)
        alert1.addAction(UIAlertAction(title: "Далее", style: .default, handler: { _ in
            self.showSecondInstruction()
        }))
        present(alert1, animated: true, completion: nil)
    }

    func showSecondInstruction() {
        let alert2 = UIAlertController(title: "Инструкция 2", message: "Свайпните вправо, чтобы добавить книгу в избранное.", preferredStyle: .alert)
        alert2.addAction(UIAlertAction(title: "Готово", style: .default, handler: { _ in
            // Сохраняем, что пользователь видел инструкции
            UserDefaults.standard.set(true, forKey: "hasSeenInstructions")
        }))
        present(alert2, animated: true, completion: nil)
    }


    func loadData() {
        if let savedFavorites = UserDefaults.standard.array(forKey: "favoriteBooks") as? [[String: String]] {
            favoriteBooks = savedFavorites
        }

        if let savedRejected = UserDefaults.standard.array(forKey: "rejectedBooks") as? [[String: String]] {
            rejectedBooks = savedRejected
        }

        unviewedBooks = bookData.filter { book in
            !favoriteBooks.contains(where: { $0["title"] == book["title"] }) &&
            !rejectedBooks.contains(where: { $0["title"] == book["title"] })
        }
    }
    
    func isFirstTimeUser() -> Bool {
        let hasSeenInstructions = UserDefaults.standard.bool(forKey: "hasSeenInstructions")
        return !hasSeenInstructions
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
    
    func refreshData() {
        DispatchQueue.main.async {
            self.swipeCardStack.reloadData()
        }
    }

    
    func saveFavorites() {
        UserDefaults.standard.set(favoriteBooks, forKey: "favoriteBooks")
    }

    func saveRejectedBooks() {
        UserDefaults.standard.set(rejectedBooks, forKey: "rejectedBooks")
    }
    
    func showReviewRejectedBooksAlert() {
        let alert = UIAlertController(title: "Упс, вы посмотрели все книги", message: "Хотите посмотреть те, что вы отклонили?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Да", style: .default, handler: { _ in
            self.unviewedBooks = self.rejectedBooks
            self.rejectedBooks.removeAll()
            self.saveRejectedBooks()
            self.refreshData()
        }))
        alert.addAction(UIAlertAction(title: "Нет", style: .cancel, handler: { _ in
            self.showNoMoreBooksAlert()
        }))
        present(alert, animated: true, completion: nil)
    }


    func showNoMoreBooksAlert() {
        let alert = UIAlertController(title: "Нет доступных книг", message: "Вы просмотрели все книги.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ОК", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

}

// MARK: - SwipeCardStackDataSource
extension BooksViewController: SwipeCardStackDataSource {
    
    func numberOfCards(in cardStack: SwipeCardStack) -> Int {
        return unviewedBooks.count
    }

    func cardStack(_ cardStack: SwipeCardStack, cardForIndexAt index: Int) -> SwipeCard {
        let card = SwipeCard()
        card.backgroundColor = .white
        let book = unviewedBooks[index]
    
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

extension BooksViewController: SwipeCardStackDelegate {
    
    func cardStack(_ cardStack: SwipeCardStack, didSwipeCardAt index: Int, with direction: SwipeDirection) {
        let book = unviewedBooks[index]
        
        if direction == .right {
            favoriteBooks.append(book)
            saveFavorites()
            delegate?.didAddBookToFavorites(book)
        } else if direction == .left {
            rejectedBooks.append(book)
            saveRejectedBooks()
        }
        
        unviewedBooks.remove(at: index)
        if unviewedBooks.isEmpty {
            if !rejectedBooks.isEmpty {
                showReviewRejectedBooksAlert()
            } else {
                showNoMoreBooksAlert()
            }
        } else {
            refreshData()
        }
    }

}
