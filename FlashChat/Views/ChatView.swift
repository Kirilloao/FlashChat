//
//  ChatView.swift
//  FlashChat
//
//  Created by Kirill Taraturin on 13.09.2023.
//

import UIKit

final class ChatView: UIView {
    
    // MARK: - Private UI Properties
    lazy var chatTableView: UITableView = {
        var tableView = UITableView(frame: self.bounds, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    private lazy var chatView: UIView = {
        var chatView = UIView()
        return chatView
    }()
    
    private lazy var chatTextField: UITextField = {
        var chatTF = UITextField()
        chatTF.placeholder = "Write a message..."
        chatTF.font = UIFont.systemFont(ofSize: 14)
        chatTF.borderStyle = .roundedRect
        chatTF.autocorrectionType = .no
        return chatTF
    }()
    
    private lazy var sentButton: UIButton = {
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
        chatView.addSubview(sentButton)
        self.addSubview(chatTableView)
        
    }
    
    private func setupConstraints() {
        chatView.snp.makeConstraints { make in
            make.height.equalTo(60)
            make.bottom.equalTo(self.snp.bottomMargin)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        sentButton.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalTo(40)
            make.right.equalToSuperview().offset(-20)
            make.top.equalToSuperview().offset(20)
        }
        
        chatTextField.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.left.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(20)
            make.right.equalTo(sentButton.snp.left).offset(-20)
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
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = chatTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ChatView: UITableViewDelegate {
}
