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

    }
    
    // MARK: - Private Methods
    private func setupConstraints() {
        chatView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

}
