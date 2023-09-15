//
//  ChatViewController.swift
//  FlashChat
//
//  Created by Kirill Taraturin on 13.09.2023.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

final class ChatViewController: UIViewController {
    
    // MARK: - Private UI Properties
    private let chatView = ChatView()
    
    // MARK: - Private Properties
    private let db = Firestore.firestore()
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(chatView)
        setupConstraints()
        setupNavigationBar()
        setupSendButton()
    }
    
    // MARK: - Private Actions
    @objc private func logOutButtonDidTapped() {
        //выходим из аккунта пользовательня при нажатии на кнопку log out
        do {
            try Auth.auth().signOut()
            if let welcomeViewController = navigationController?.viewControllers.first(where: { $0 is WelcomeViewController }) {
                navigationController?.popToViewController(welcomeViewController, animated: true)
            }
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
    
    @objc private func sendButtonDidTapped() {
        // отправляем сообщение введеное пользавателем на сервер
        if let messageBody = chatView.chatTextField.text,  let messageSender = Auth.auth().currentUser?.email {
            db.collection(K.FStore.collectionName).addDocument(data: [
                K.FStore.senderField: messageSender,
                K.FStore.bodyField: messageBody]) { error in
                    if let newError = error {
                        print(newError)
                    } else {
                        print("Successfuly saved data")
                    }
                }
        }
    }
    
    // MARK: - Private Methods
    private func loadMessages() {
        
    }
    
    // установка констрейнтов
    private func setupConstraints() {
        chatView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    // настройка navigationBar
    private func setupNavigationBar() {
        title = K.appName
        navigationItem.hidesBackButton = true
        let logOutButton = UIBarButtonItem(
            title: "LogOut",
            style: .done,
            target: self,
            action: #selector(logOutButtonDidTapped))
        
        navigationItem.rightBarButtonItem = logOutButton
    }
    
    // добавляем target для кнопки
    private func setupSendButton() {
        chatView.sendButton.addTarget(
            self,
            action: #selector(sendButtonDidTapped),
            for: .touchUpInside
        )
    }
}
