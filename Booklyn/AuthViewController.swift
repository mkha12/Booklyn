//
//  AuthViewController.swift
//  Booklyn
//
//  Created by MARIIA on 27.04.24.
//

import UIKit

final class AuthViewController: UIViewController {
    
    private var greeting: UILabel!
    private var greetingDescrip: UILabel!
    private var signAppleButton: UIButton!
    private var signGoogleButton: UIButton!
    private var privaceLabelButton: UIButton!
    private var leftSeparatorLine: UIView!
    private var rightSeparatorLine: UIView!
    private var orLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setupUI()
        setupOrSeparator()
        setupConstraint()
    }
    
    private func setupUI() {
        
        greeting = UILabel()
        greeting.text = ("Welcome to\nBooklyn")
        greeting.textColor = .black
        greeting.font = .systemFont(ofSize: 50, weight: .medium)
        greeting.textAlignment = .center
        greeting.numberOfLines = 2
        greeting.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(greeting)
        
        greetingDescrip = UILabel()
        greetingDescrip.text = ("Choose your book")
        greetingDescrip.textColor = .black
        greetingDescrip.font = UIFont.italicSystemFont(ofSize: 15)
        greetingDescrip.textAlignment = .center
        greetingDescrip.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(greetingDescrip)
        
        signAppleButton = UIButton()
        signAppleButton.setImage(UIImage(systemName: "applelogo"), for: .normal)
        signAppleButton.setTitle("Continue with Apple", for: .normal)
        signAppleButton.setTitleColor(.black, for: .normal)
        signAppleButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        signAppleButton.backgroundColor = .clear
        signAppleButton.layer.borderWidth = 1
        signAppleButton.layer.borderColor = UIColor.gray.cgColor
        signAppleButton.layer.cornerRadius = 15
        signAppleButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(signAppleButton)
        
        signGoogleButton = UIButton()
        signGoogleButton.setImage(UIImage(systemName: "googlelogo"), for: .normal)
        signGoogleButton.setTitle("Continue with Google", for: .normal)
        signGoogleButton.setTitleColor(.black, for: .normal)
        signGoogleButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        signGoogleButton.layer.borderWidth = 1
        signGoogleButton.layer.borderColor = UIColor.gray.cgColor
        signGoogleButton.backgroundColor = .clear
        signGoogleButton.layer.cornerRadius = 15
        signGoogleButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(signGoogleButton)
        
        privaceLabelButton = UIButton()
        privaceLabelButton.setTitle("Privacy policy", for: .normal)
        privaceLabelButton.setTitleColor(.black, for: .normal)
        privaceLabelButton.titleLabel?.font = .systemFont(ofSize: 15)
        privaceLabelButton.backgroundColor = .clear
        privaceLabelButton.layer.cornerRadius = 15
        privaceLabelButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(privaceLabelButton)
    }
    
    private func setupOrSeparator() {
        
        orLabel = UILabel()
        orLabel.text = "or"
        orLabel.textColor = .gray
        orLabel.font = UIFont.systemFont(ofSize: 14)
        orLabel.textAlignment = .center
        orLabel.backgroundColor = .white
        orLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(orLabel)
        
        leftSeparatorLine = UIView()
        leftSeparatorLine.backgroundColor = .lightGray
        leftSeparatorLine.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(leftSeparatorLine)
        
        rightSeparatorLine = UIView()
        rightSeparatorLine.backgroundColor = .lightGray
        rightSeparatorLine.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(rightSeparatorLine)
        
        
    }
    
    private func setupConstraint() {
        
        NSLayoutConstraint.activate([
            
            greeting.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor,constant: 150),
            greeting.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            greeting.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            greeting.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            greetingDescrip.topAnchor.constraint(equalTo:greeting.bottomAnchor,constant: 10),
            greetingDescrip.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            signAppleButton.topAnchor.constraint(equalTo: greetingDescrip.bottomAnchor,constant: 80),
            signAppleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            //signAppleButton.widthAnchor.constraint(equalToConstant: 200),
            signAppleButton.heightAnchor.constraint(equalToConstant: 50),
            signAppleButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            signAppleButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            signGoogleButton.topAnchor.constraint(equalTo: signAppleButton.bottomAnchor,constant: 10),
            signGoogleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signGoogleButton.heightAnchor.constraint(equalToConstant: 50),
            signGoogleButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            signGoogleButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            leftSeparatorLine.centerYAnchor.constraint(equalTo: orLabel.centerYAnchor),
            leftSeparatorLine.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            leftSeparatorLine.trailingAnchor.constraint(equalTo: orLabel.leadingAnchor, constant: -10),
            leftSeparatorLine.heightAnchor.constraint(equalToConstant: 1),
            rightSeparatorLine.centerYAnchor.constraint(equalTo: orLabel.centerYAnchor),
            rightSeparatorLine.leadingAnchor.constraint(equalTo: orLabel.trailingAnchor, constant: 10),
            rightSeparatorLine.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            rightSeparatorLine.heightAnchor.constraint(equalToConstant: 1),
        
            orLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            orLabel.topAnchor.constraint(equalTo: signGoogleButton.bottomAnchor, constant: 20),
            orLabel.widthAnchor.constraint(equalToConstant: 30),
            orLabel.heightAnchor.constraint(equalToConstant: 20),
            
            privaceLabelButton.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor,constant: 20),
            privaceLabelButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            privaceLabelButton.widthAnchor.constraint(equalToConstant: 200),
            privaceLabelButton.heightAnchor.constraint(equalToConstant: 70),
            
        ])
    }

   }

