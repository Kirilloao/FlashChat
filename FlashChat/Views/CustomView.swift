//
//  CustomView.swift
//  FlashChat
//
//  Created by Kirill Taraturin on 13.09.2023.
//

import UIKit

class CustomView: UIView {

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
    
    lazy var registerButton: UIButton = {
        var registerButton = UIButton(type: .system)
        registerButton.setTitle("", for: .normal)
        registerButton.tintColor = UIColor(named: "BrandBlue")
        registerButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        return registerButton
    }()
    
    // MARK: - Init
    init(buttonTitle: String) {
        super.init(frame: .zero)
        registerButton.setTitle(buttonTitle, for: .normal)
    }
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
        let customView = UIView()
        customView.layer.cornerRadius = 25
        customView.backgroundColor = .white
        customView.layer.shadowColor = UIColor.black.cgColor
        customView.layer.shadowOpacity = 0.5 // Прозрачность тени
        customView.layer.shadowOffset = CGSize(width: 0, height: 3) // Смещение тени относительно view
        customView.layer.shadowRadius = 2 // Радиус размытия тени
        return customView
    }
    
    // метод для создания textField
    private func createTextField(with placeholder: String) -> UITextField {
        let customTF = UITextField()
        customTF.placeholder = placeholder
        customTF.autocorrectionType = .no
        customTF.borderStyle = .none
        customTF.font = UIFont.systemFont(ofSize: 25)
        customTF.textAlignment = .center
        return customTF
    }
}
