//
//  RegisterViewController.swift
//  FlashChat
//
//  Created by Kirill Taraturin on 13.09.2023.
//

import UIKit

final class RegisterViewController: UIViewController {
    
    // MARK: - Private UIProperties
    private let registerView = RegisterView()
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(registerView)
        setupConstraints()
    }
    
    // MARK: - Private Methods
    private func setupConstraints() {
        registerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
