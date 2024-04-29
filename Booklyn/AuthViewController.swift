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
    private var signInButton: UIButton!
    private var signUpButton: UIButton!
    private var privaceLabelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setupUI()
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
        
        signInButton = UIButton()
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.setTitleColor(.white, for: .normal)
        signInButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        signInButton.backgroundColor = .brown
        signInButton.layer.cornerRadius = 15
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(signInButton)
        
        signUpButton = UIButton()
        signUpButton.setTitle("Sing Up", for: .normal)
        signUpButton.setTitleColor(.white, for: .normal)
        signUpButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        signUpButton.backgroundColor = .brown
        signUpButton.layer.cornerRadius = 15
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(signUpButton)
        
        privaceLabelButton = UIButton()
        privaceLabelButton.setTitle("Privacy policy", for: .normal)
        privaceLabelButton.setTitleColor(.black, for: .normal)
        privaceLabelButton.titleLabel?.font = .systemFont(ofSize: 15)
        privaceLabelButton.backgroundColor = .clear
        privaceLabelButton.layer.cornerRadius = 15
        privaceLabelButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(privaceLabelButton)
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            
            greeting.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor,constant: 150),
            greeting.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            greeting.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            greeting.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            greetingDescrip.topAnchor.constraint(equalTo:greeting.bottomAnchor,constant: 10),
            greetingDescrip.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            signInButton.topAnchor.constraint(equalTo: greetingDescrip.bottomAnchor,constant: 80),
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInButton.widthAnchor.constraint(equalToConstant: 200),
            signInButton.heightAnchor.constraint(equalToConstant: 50),
            
            signUpButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor,constant: 10),
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpButton.widthAnchor.constraint(equalToConstant: 200),
            signUpButton.heightAnchor.constraint(equalToConstant: 50),
            
            //privaceLabelButton.topAnchor.constraint(equalTo: signUpButton.bottomAnchor,constant: 100),
            privaceLabelButton.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor,constant: 20),
            privaceLabelButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            privaceLabelButton.widthAnchor.constraint(equalToConstant: 200),
            privaceLabelButton.heightAnchor.constraint(equalToConstant: 70),
            
        ])
    }
}
