//
//  PartMemberCVCell.swift
//  SOPT27-iOS-4th-Assignment
//
//  Created by 이주혁 on 2020/12/12.
//

import UIKit

class PartMemberCVCell: UICollectionViewCell {
    static let identifier = "PartMemberCVCell"
    
    override func awakeFromNib() {
        self.makeRounded(cornerRadius: 5)
    }
}
