//
//  WelcomeViewController.swift
//  FlashChat
//
//  Created by Kirill Taraturin on 13.09.2023.
//

import UIKit
import SnapKit

final class WelcomeViewController: UIViewController {
    
    // MARK: Private UI Properties
    private let mainView = WelcomeView()
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mainView)
        setupConstraints()
        setupButtons()
        setupAnimationForMainLabel()
    }
    
    // MARK: - Private Actions
    @objc private func openVC(_ sender: UIButton) {
        if sender == mainView.logInButton {
            let logInVC = LoginViewController()
//            present(logInVC, animated: true)
            navigationController?.pushViewController(logInVC, animated: true)
        } else {
            let registerVC = RegisterViewController()
//            present(registerVC, animated: true)
            navigationController?.pushViewController(registerVC, animated: true)
        }
    }
    
    // MARK: - Private Methods
    private func setupConstraints() {
        mainView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    // методы для перехода на другой экран
    private func setupButtons() {
        mainView.logInButton.addTarget(
            self,
            action: #selector(openVC(_:)),
            for: .touchUpInside
        )
        
        mainView.registerButton.addTarget(
            self,
            action: #selector(openVC(_:)),
            for: .touchUpInside
        )
    }
    
    // анимация добавления символов в label
    private func setupAnimationForMainLabel() {
        mainView.mainLabel.text = "⚡️FlashChat"
    }
}

