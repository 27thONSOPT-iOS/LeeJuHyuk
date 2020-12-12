//
//  CollectionTestVC.swift
//  CollectionViewPractice
//
//  Created by 이주혁 on 2020/11/12.
//

import UIKit

class CollectionTestVC: UIViewController {
    @IBOutlet var collectionView: UICollectionView!
    
    
    let horizonInset: CGFloat = 24.0
    let topInset: CGFloat = 41.0
    let bottomInset: CGFloat = 50
    
    let itemSpacing: CGFloat = 27.0
    let lineSpacing: CGFloat = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension CollectionTestVC : UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        }
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeaderCell", for: indexPath)
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath)
        
        return cell
    }
}

extension CollectionTestVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenHeight = UIScreen.main.bounds.height
        
        if indexPath.section == 0 {
            
            
            let cellHeight = 425 / 812 * screenHeight
            
            return CGSize(width: collectionView.frame.width,
                          height: cellHeight)
        }
        
        let cellWidth = (collectionView.frame.width - horizonInset * 2 - itemSpacing) / 2
        let cellHeight = 225 / 812 * screenHeight
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        return itemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        return lineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 0 {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            
        }
        return UIEdgeInsets(top: topInset, left: horizonInset, bottom: bottomInset, right: horizonInset)
    }
}
