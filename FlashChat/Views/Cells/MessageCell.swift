//
//  MessageCell.swift
//  FlashChat
//
//  Created by Kirill Taraturin on 14.09.2023.
//

import UIKit

final class MessageCell: UITableViewCell {

    // MARK: - IB Outlets
    @IBOutlet var messageBubble: UIView!
    @IBOutlet var label: UILabel!
    @IBOutlet var rightImageView: UIImageView!
    @IBOutlet var leftImageView: UIImageView!
    
    // MARK: - Override Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        messageBubble.layer.cornerRadius = messageBubble.frame.size.height / 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
