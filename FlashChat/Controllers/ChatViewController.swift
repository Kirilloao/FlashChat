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
        loadMessages()
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
                K.FStore.bodyField: messageBody,
                K.FStore.dateField: Date().timeIntervalSince1970
            ]) { error in
                if let newError = error {
                    print(newError)
                } else {
                    print("Successfuly saved data")
                    //очищаем textField после сохранения сообщения
                    self.chatView.chatTextField.text = ""
                    
                    // прокручиваем tableView к последнему добавленному элементу
                    let newIndex = self.chatView.messages.count
                    let indexPath = IndexPath(row: newIndex - 1, section: 0)
                    self.chatView.chatTableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
                }
            }
        }
     
    }
    
    // MARK: - Private Methods
    private func loadMessages() {
        //загружаем сообщения с сервера и добавляем их в массив из которого обновляется tableView
        db.collection(K.FStore.collectionName)
            .order(by: K.FStore.dateField)
            .addSnapshotListener { querySnapshot, error in
                
                self.chatView.messages = []
                if let newError = error {
                    
                    print("Tehre was an issue retrieving data from Firestore. \(newError)")
                } else {
                    if let snapshotDocuments = querySnapshot?.documents {
                        for doc in snapshotDocuments {
                            let data = doc.data()
                            if let messageSender = data[K.FStore.senderField] as? String, let messageBody = data[K.FStore.bodyField] as? String {
                                let newMessage = Message(sender: messageSender, body: messageBody)
                                self.chatView.messages.append(newMessage)
                                
                                DispatchQueue.main.async {
                                    self.chatView.chatTableView.reloadData()
                                }
                                
                            }
                        }
                    }
                }
            }
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
