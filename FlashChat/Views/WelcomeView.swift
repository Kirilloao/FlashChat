//
//  MainView.swift
//  FlashChat
//
//  Created by Kirill Taraturin on 13.09.2023.
//

import UIKit

final class WelcomeView: UIView {
    
    // MARK: - Properties
    private lazy var mainLabel: UILabel = {
        var mainLabel = UILabel()
        mainLabel.text = "⚡️FlashChat"
        mainLabel.textColor = UIColor(named: "BrandBlue")
        mainLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 50)
        return mainLabel
    }()
    
    private lazy var logInButton: UIButton = {
        var logButton = createButton(with: "Log In")
        return logButton
    }()
    
    private lazy var registerButton: UIButton = {
        var registerButton = createButton(with: "Register")
        registerButton.tintColor = UIColor(named: "BrandBlue")
        registerButton.backgroundColor = UIColor(named: "BrandLightBlue")
        return registerButton
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        addViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func addViews() {
        self.addSubview(mainLabel)
        self.addSubview(logInButton)
        self.addSubview(registerButton)
    }
    
    private func setupConstraints() {
        mainLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(60)
        }
        
        registerButton.snp.makeConstraints { make in
            make.height.equalTo(48)
            make.right.equalToSuperview()
            make.left.equalToSuperview()
        }
        
        logInButton.snp.makeConstraints { make in
            make.top.equalTo(registerButton.snp.bottom).offset(8)
            make.bottom.equalToSuperview().offset(-40)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(61)
        }
    }
    
    // метод для создания кнопки
    private func createButton(with title: String) -> UIButton {
        let customButton = UIButton(type: .system)
        customButton.setTitle(title, for: .normal)
        customButton.tintColor = .white
        customButton.backgroundColor = .systemTeal
        customButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        return customButton
    }
}
