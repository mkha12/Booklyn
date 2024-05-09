//
//  AuthViewController.swift
//  Booklyn
//
//  Created by MARIIA on 27.04.24.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import GoogleSignIn


final class AuthViewController: UIViewController {
    
    private var greeting: UILabel!
    private var greetingDescrip: UILabel!
    private var signAppleButton: UIButton!
    private var signGoogleButton: UIButton!
    private var leftSeparatorLine: UIView!
    private var rightSeparatorLine: UIView!
    private var orLabel: UILabel!
    private var emailTextField: UITextField!
    private var passwordTextField: UITextField!
    private var loginInButton: UIButton!
    private var resertPasswordButton: UIButton!
    private var privaceLabelButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setupUI()
        setupOrSeparator()
        setupConstraint()
        setupGoogleSignIn()
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
        signAppleButton.addTarget(self, action: #selector(didTapApple), for: .touchUpInside)
        view.addSubview(signAppleButton)
        
        signGoogleButton = UIButton()
        signGoogleButton.setImage(UIImage(named: "ios_neutral_sq_na"), for: .normal)
        signGoogleButton.setTitle("Continue with Google", for: .normal)
        signGoogleButton.setTitleColor(.black, for: .normal)
        signGoogleButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        signGoogleButton.layer.borderWidth = 1
        signGoogleButton.layer.borderColor = UIColor.gray.cgColor
        signGoogleButton.backgroundColor = .clear
        signGoogleButton.layer.cornerRadius = 15
        signGoogleButton.translatesAutoresizingMaskIntoConstraints = false
        signGoogleButton.addTarget(self, action: #selector(didTapGoogle), for: .touchUpInside)
        view.addSubview(signGoogleButton)
        
        emailTextField = UITextField()
        emailTextField.placeholder = "Email"
        emailTextField.clearButtonMode = .whileEditing
        emailTextField.backgroundColor = .light_brown
        emailTextField.leftViewMode = .always
        emailTextField.layer.cornerRadius = 16
        emailTextField.layer.borderWidth = 1
        emailTextField.layer.borderColor = UIColor.gray.cgColor
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(emailTextField)
        
        let emailPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        emailTextField.leftView = emailPaddingView
        emailTextField.leftViewMode = .always
        
        passwordTextField = UITextField()
        passwordTextField.placeholder = "Password"
        passwordTextField.clearButtonMode = .whileEditing
        passwordTextField.backgroundColor = .light_brown
        passwordTextField.leftViewMode = .always
        passwordTextField.layer.cornerRadius = 16
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.borderColor = UIColor.gray.cgColor
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordTextField)
        
        let passwordPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        passwordTextField.leftView = passwordPaddingView
        passwordTextField.leftViewMode = .always
        
        loginInButton = UIButton()
        loginInButton.setTitle("Log In", for: .normal)
        loginInButton.setTitleColor(.black, for: .normal)
        loginInButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        loginInButton.backgroundColor = .clear
        loginInButton.layer.borderWidth = 1
        loginInButton.layer.borderColor = UIColor.gray.cgColor
        loginInButton.layer.cornerRadius = 15
        loginInButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginInButton)
        
        resertPasswordButton = UIButton()
        resertPasswordButton.setTitle("Forgot your password?", for: .normal)
        resertPasswordButton.setTitleColor(.black, for: .normal)
        resertPasswordButton.titleLabel?.font = .systemFont(ofSize: 10)
        resertPasswordButton.backgroundColor = .clear
        resertPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(resertPasswordButton)
        
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
            orLabel.topAnchor.constraint(equalTo: signGoogleButton.bottomAnchor, constant: 10),
            orLabel.widthAnchor.constraint(equalToConstant: 30),
            orLabel.heightAnchor.constraint(equalToConstant: 20),
            
            emailTextField.topAnchor.constraint(equalTo: orLabel.bottomAnchor,constant: 10),
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor,constant: 10),
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            loginInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor,constant: 10),
            loginInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginInButton.heightAnchor.constraint(equalToConstant: 50),
            loginInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            resertPasswordButton.topAnchor.constraint(equalTo: loginInButton.bottomAnchor,constant: 0),
            resertPasswordButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            privaceLabelButton.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor,constant: 20),
            privaceLabelButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            privaceLabelButton.widthAnchor.constraint(equalToConstant: 200),
            privaceLabelButton.heightAnchor.constraint(equalToConstant: 70),
            
        ])
    }
    
    @objc private func didTapApple() {
        
    }
    
    
    private func setupGoogleSignIn() {
        guard let path = Bundle.main.path(forResource: "GoogleService-Info", ofType: "plist"),
              let dict = NSDictionary(contentsOfFile: path),
              let clientID = dict["GIDClientID"] as? String else {
            return
        }
        GIDSignIn.sharedInstance.configuration = GIDConfiguration(clientID: clientID)
    }
    
    
    
    @objc private func didTapGoogle() {
        setupGoogleSignIn()
        
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { [weak self] result, error in
            guard error == nil else {
                guard let strongSelf = self else { return }
                if let error = error {
                    print("Google Sign-In error: \(error.localizedDescription)")
                    return
                }
                return
            }
            guard let user = result?.user,
                  let idToken = user.idToken?.tokenString
                    
            else {
                print("Authentication error: Missing auth tokens")
                return
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: user.accessToken.tokenString)
            
            Auth.auth().signIn(with: credential) { authResult, error in
                if let error = error {
                    print("Firebase Auth error: \(error.localizedDescription)")
                } else {
                    if let email = user.profile?.email {
                        let saveSuccessful = KeychainManager.shared.save(email, for: "userEmail")
                    }
                    DispatchQueue.main.async {
                        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                              let sceneDelegate = windowScene.delegate as? SceneDelegate else { return }
                        
                        sceneDelegate.updateRootViewController()
                    }
                }
            }
        }
        
        
    }
}
