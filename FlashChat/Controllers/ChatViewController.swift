//
//  ChatViewController.swift
//  FlashChat
//
//  Created by Kirill Taraturin on 13.09.2023.
//

import UIKit

final class ChatViewController: UIViewController {
    
    // MARK: - Private UI Properties
    private let chatView = ChatView()
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(chatView)
        setupConstraints()
        setupNavigationBar()
    }
    
    // MARK: - Private Actions
    @objc private func logOutButtonDidTapped() {
        
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
