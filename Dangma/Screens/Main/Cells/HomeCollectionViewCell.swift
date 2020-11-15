//
//  HomeCollectionViewCell.swift
//  Dangma
//
//  Created by soyounglee on 2020/11/14.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {

    static let identifier = "HomeCollectionViewCell"
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var whereLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var heartLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    
    static func nib() -> UINib {
        return UINib(nibName: "HomeCollectionViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .link
        // Initialization code
    }

}
