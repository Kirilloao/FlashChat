//
//  LoginViewController.swift
//  FlashChat
//
//  Created by Kirill Taraturin on 13.09.2023.
//

import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: - Private UI Properties
    private let loginView = LoginView(buttonTitle: "Login")
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(loginView)
        setupConstraints()
    }
    
    // MARK: - Private Methods
    private func setupConstraints() {
        loginView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
