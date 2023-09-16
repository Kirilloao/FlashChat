//
//  WelcomeViewController.swift
//  FlashChat
//
//  Created by Kirill Taraturin on 13.09.2023.
//

import UIKit
import SnapKit

final class WelcomeViewController: UIViewController {
    
    // MARK: Private UI Properties
    private let mainView = WelcomeView()
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mainView)
        setupConstraints()
        setupButtons()
        setupAnimationForMainLabel()
        setupNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        navigationController?.isNavigationBarHidden = false
    }
    
    // MARK: - Private Actions
    @objc private func openVC(_ sender: UIButton) {
        if sender == mainView.logInButton {
            let logInVC = LoginViewController()
            navigationController?.pushViewController(logInVC, animated: true)
        } else {
            let registerVC = RegisterViewController()
            navigationController?.pushViewController(registerVC, animated: true)
        }
    }
    
    // MARK: - Private Methods
    private func setupConstraints() {
        mainView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    // методы для перехода на другой экран
    private func setupButtons() {
        mainView.logInButton.addTarget(
            self,
            action: #selector(openVC(_:)),
            for: .touchUpInside
        )
        
        mainView.registerButton.addTarget(
            self,
            action: #selector(openVC(_:)),
            for: .touchUpInside
        )
    }
    
    // анимация добавления символов в label
    private func setupAnimationForMainLabel() {
        mainView.mainLabel.text = K.appName
    }
    
    private func setupNavigationBar() {
        let navBarAppearance = UINavigationBarAppearance()
        
        //устанавливаем цвет для navigationBar
        navBarAppearance.backgroundColor = UIColor(named: K.BrandColors.blue)
        
        // меняем цвет для текста
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        // меняем цвет в статичном положении и в скролинге
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
    }
}

