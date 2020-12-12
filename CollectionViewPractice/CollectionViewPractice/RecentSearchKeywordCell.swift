//
//  RecentSearchKeywordCell.swift
//  CollectionViewPractice
//
//  Created by 이주혁 on 2020/11/11.
//

import UIKit

class RecentSearchKeywordCell: UICollectionViewCell {
    static let identifier = "RecentSearchKeywordCell"
    
    override func awakeFromNib() {
        self.contentView.layer.cornerRadius = self.frame.width / 4
    }
}
