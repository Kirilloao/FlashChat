//
//  RegisterView.swift
//  FlashChat
//
//  Created by Kirill Taraturin on 13.09.2023.
//

import UIKit

final class RegisterView: UIView {
    
    // MARK: - Private UI Properties
    private lazy var emailView: UIView = {
        var emailView = createView()
        return emailView
    }()
    
    private lazy var emailTextField: UITextField = {
        var emailTF = createTextField(with: "Email")
        return emailTF
    }()
    
    private lazy var passwordView: UIView = {
        var passwordView = createView()
        return passwordView
    }()
    
    private lazy var passwordTextField: UITextField = {
        var passwordTF = createTextField(with: "Password")
        return passwordTF
    }()
    
    private lazy var registerButton: UIButton = {
        var registerButton = UIButton(type: .system)
        registerButton.setTitle("Register", for: .normal)
        registerButton.tintColor = UIColor(named: "BrandBlue")
        registerButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        return registerButton
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(named: "BrandLightBlue")
        addViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func addViews() {
        self.addSubview(emailView)
        emailView.addSubview(emailTextField)
        self.addSubview(passwordView)
        passwordView.addSubview(passwordTextField)
        self.addSubview(registerButton)
    }
    
    private func setupConstraints() {
        emailView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.height.equalTo(60)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(5)
            make.right.equalToSuperview().offset(-5)
            make.top.equalToSuperview().offset(5)
            make.bottom.equalToSuperview().offset(-5)
        }
        
        passwordView.snp.makeConstraints { make in
            make.top.equalTo(emailView.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.height.equalTo(60)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(5)
            make.right.equalToSuperview().offset(-5)
            make.top.equalToSuperview().offset(5)
            make.bottom.equalToSuperview().offset(-5)
        }
        
        registerButton.snp.makeConstraints { make in
            make.top.equalTo(passwordView.snp.bottom).offset(30)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(40)
        }
    }
    
    // метод для создания view
    private func createView() -> UIView {
        let view = UIView()
        view.layer.cornerRadius = 25
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5 // Прозрачность тени
        view.layer.shadowOffset = CGSize(width: 0, height: 3) // Смещение тени относительно view
        view.layer.shadowRadius = 2 // Радиус размытия тени
        return view
    }
    
    // метод для создания textField
    private func createTextField(with placeholder: String) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.autocorrectionType = .no
        textField.borderStyle = .none
        textField.font = UIFont.systemFont(ofSize: 25)
        textField.textAlignment = .center
        return textField
    }
}
