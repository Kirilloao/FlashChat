//
//  LoginViewController.swift
//  FlashChat
//
//  Created by Kirill Taraturin on 13.09.2023.
//

import UIKit
import FirebaseAuth

final class LoginViewController: UIViewController {
    
    // MARK: - Private UI Properties
    private let loginView = LoginView(buttonTitle: "Login")
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(loginView)
        setupConstraints()
        setupActionButton()
        
        loginView.emailTextField.text = "www.kirilltaraturin747@gmail.com"
        loginView.passwordTextField.text = "11223344"
    }
    
    // MARK: - Private Methods
    private func setupConstraints() {
        loginView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupActionButton() {
        loginView.actionButton.addTarget(
            self,
            action: #selector(openVC),
            for: .touchUpInside)
    }
    
    // MARK: - Private Actions
    @objc private func openVC() {
        // проверям есть ли такой логин и пароль на сервере, если да, то делаем переход
        if let email = loginView.emailTextField.text, let password = loginView.passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                if let newError = error {
                    self?.loginView.errorLabel.text = newError.localizedDescription
                    self?.loginView.errorLabel.isHidden = false
                    print(newError)
                } else {
                    let chatVC = ChatViewController()
                    self?.navigationController?.pushViewController(chatVC, animated: true)
                }
            }
        }
    }
}
