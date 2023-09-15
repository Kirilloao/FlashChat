//
//  ChatView.swift
//  FlashChat
//
//  Created by Kirill Taraturin on 13.09.2023.
//

import UIKit

final class ChatView: UIView {
    
    // MARK: - Public Properties
    var messages: [Message] = [
        Message(sender: "www.kirilltaraturin747@gmail.com", body: "Hey!"),
        Message(sender: "123@mail.com", body: "Hello!"),
        Message(sender: "456@mail.com", body: "What's up?")
    ]
    
    // MARK: - Private UI Properties
    lazy var chatTableView: UITableView = {
        var tableView = UITableView(frame: self.bounds, style: .grouped)
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        tableView.allowsSelection = false
        return tableView
    }()
    
    private lazy var chatView: UIView = {
        var chatView = UIView()
        return chatView
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
            make.top.equalTo(self.snp.topMargin)
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
        guard
            let cell = chatTableView.dequeueReusableCell(
                withIdentifier: K.cellIdentifier,
                for: indexPath) as? MessageCell
        else {
            return UITableViewCell()
        }
        
        cell.label.text = messages[indexPath.row].body
        
        return cell
    }
}
