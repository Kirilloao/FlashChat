//
//  RegisterViewController.swift
//  FlashChat
//
//  Created by Kirill Taraturin on 13.09.2023.
//

import UIKit

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
        let chatVC = ChatViewController()
        chatVC.modalPresentationStyle = .fullScreen
        present(chatVC, animated: true)
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
