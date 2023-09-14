//
//  ChatViewController.swift
//  FlashChat
//
//  Created by Kirill Taraturin on 13.09.2023.
//

import UIKit
import FirebaseAuth

final class ChatViewController: UIViewController {
    
    // MARK: - Private UI Properties
    private let chatView = ChatView()
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(chatView)
        setupConstraints()
        setupNavigationBar()
        
        title = K.appName
        navigationItem.hidesBackButton = true
    }
    
    // MARK: - Private Actions
    @objc private func logOutButtonDidTapped() {
        do {
            try Auth.auth().signOut()
            
            if let welcomeViewController = navigationController?.viewControllers.first(where: { $0 is WelcomeViewController }) {
                navigationController?.popToViewController(welcomeViewController, animated: true)
            }
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
    
    // MARK: - Private Methods
    private func setupConstraints() {
        chatView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupNavigationBar() {
        let logOutButton = UIBarButtonItem(
            title: "LogOut",
            style: .done,
            target: self,
            action: #selector(logOutButtonDidTapped))
        
        navigationItem.rightBarButtonItem = logOutButton
    }
}
