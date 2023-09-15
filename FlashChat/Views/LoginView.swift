//
//  LoginView.swift
//  FlashChat
//
//  Created by Kirill Taraturin on 13.09.2023.
//

import UIKit

final class LoginView: CustomView {
    
    // MARK: - Init
    override init(buttonTitle: String) {
        super.init(frame: .zero)
        actionButton.setTitle(buttonTitle, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
