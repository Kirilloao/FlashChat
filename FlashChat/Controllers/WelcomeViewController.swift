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
    }
    
    // MARK: - Private Methods
    private func setupConstraints() {
        mainView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
}

