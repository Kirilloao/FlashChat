//
//  RegisterViewController.swift
//  FlashChat
//
//  Created by Kirill Taraturin on 13.09.2023.
//

import UIKit
import FirebaseAuth

final class RegisterViewController: UIViewController {
    
    // MARK: - Private UIProperties
    private let registerView = RegisterView(buttonTitle: "Register")
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(registerView)
        setupConstraints()
        setupActionButton()
        
    }
    
    // MARK: - Private Actions
    @objc private func openVC() {
        if let email = registerView.emailTextField.text, let password = registerView.passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
                if let newError = error {
                    self?.registerView.errorLabel.text = newError.localizedDescription
                    self?.registerView.errorLabel.isHidden = false
                    print(newError.localizedDescription)
                } else {
                    let chatVC = ChatViewController()
                    self?.navigationController?.pushViewController(chatVC, animated: true)
                }
            }
            
        }
    }
    
    // MARK: - Private Methods
    private func setupConstraints() {
        registerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupActionButton() {
        registerView.actionButton.addTarget(
            self,
            action: #selector(openVC),
            for: .touchUpInside)
    }
}
