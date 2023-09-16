//
//  ChatView.swift
//  FlashChat
//
//  Created by Kirill Taraturin on 13.09.2023.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

final class ChatView: UIView {
    
    // MARK: - Public Properties
    var messages: [Message] = []
    
    // MARK: - Public UI Properties
    lazy var chatTableView: UITableView = {
        var tableView = UITableView(frame: self.bounds, style: .grouped)
        tableView.dataSource = self
        tableView.register(
            UINib(nibName: K.cellNibName, bundle: nil),
            forCellReuseIdentifier: K.cellIdentifier
        )
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        tableView.allowsSelection = false
        return tableView
    }()
    
    lazy var chatTextField: UITextField = {
        var chatTF = UITextField()
        chatTF.placeholder = "Write a message..."
        chatTF.font = UIFont.systemFont(ofSize: 14)
        chatTF.borderStyle = .roundedRect
        chatTF.autocorrectionType = .no
        return chatTF
    }()
    
    lazy var sendButton: UIButton = {
        var sentButton = UIButton(type: .system)
        sentButton.setImage(UIImage(systemName: "paperplane.fill"), for: .normal)
        sentButton.tintColor = .white
        return sentButton
    }()
    
    // MARK: - Private UI Properties
    private lazy var chatView: UIView = {
        var chatView = UIView()
        return chatView
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(named: "BrandPurple")
        
        addViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func addViews() {
        self.addSubview(chatView)
        chatView.addSubview(chatTextField)
        chatView.addSubview(sendButton)
        self.addSubview(chatTableView)
    }
    
    private func setupConstraints() {
        chatView.snp.makeConstraints { make in
            make.height.equalTo(60)
            make.bottom.equalTo(self.snp.bottomMargin)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        sendButton.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalTo(40)
            make.right.equalToSuperview().offset(-20)
            make.top.equalToSuperview().offset(20)
        }
        
        chatTextField.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.left.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(20)
            make.right.equalTo(sendButton.snp.left).offset(-20)
        }
        
        chatTableView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.topMargin).offset(-8)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalTo(chatView.snp.top)
        }
    }
}

// MARK: - UITableViewDataSource
extension ChatView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let message = messages[indexPath.row]
        
        guard
            let cell = chatTableView.dequeueReusableCell(
                withIdentifier: K.cellIdentifier,
                for: indexPath) as? MessageCell
        else {
            return UITableViewCell()
        }
        
        cell.label.text = message.body
        
        // сообщение от текущего пользователя
        if message.sender == Auth.auth().currentUser?.email {
            cell.leftImageView.isHidden = true
            cell.rightImageView.isHidden = false
            cell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.lightPurple)
            cell.label.textColor = UIColor(named: K.BrandColors.purple)
        }
        // сообщегние от другого пользователя
        else {
            cell.leftImageView.isHidden = false
            cell.rightImageView.isHidden = true
            cell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.purple)
            cell.label.textColor = UIColor(named: K.BrandColors.lightPurple)
        }
        return cell
    }
}
