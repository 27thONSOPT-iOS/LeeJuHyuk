//
//  ViewController.swift
//  CollectionViewPractice
//
//  Created by 이주혁 on 2020/11/11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var collectionViewTest1: UICollectionView!
    @IBOutlet var collectionViewTest2: UICollectionView!
    @IBOutlet var collectionViewTest3: UICollectionView!
    
    // CollectionView 1의 간격
    let cv1TopInset: CGFloat = 21
    let cv1HorizonInset: CGFloat = 16
    let cv1BottomInset: CGFloat = 38
    let cv1RightSpacing: CGFloat = 60
    let cv1ItemSpacing: CGFloat = 8
    let cv1LineSpacing: CGFloat = 8
    
    // CollectionView 2의 간격
    let cv2TopInset: CGFloat = 10
    let cv2HorizonInset: CGFloat = 16
    let cv2BottomInset: CGFloat = 25
    let cv2RightSpacing: CGFloat = 71
    let cv2ItemSpacing: CGFloat = 0
    let cv2LineSpacing: CGFloat = 0
    
    // CollectionView 3의 간격
    let cv3TopInset: CGFloat = 21
    let cv3HorizonInset: CGFloat = 16
    let cv3BottomInset: CGFloat = 38
    let cv3RightSpacing: CGFloat = 33
    let cv3ItemSpacing: CGFloat = 8
    let cv3LineSpacing: CGFloat = 8
    
    var keywords: [String] = ["가나다라마바사","가나다라마사","가라마바사","가나다라","바사","가라마바사","가나다"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionViewTest1.dataSource = self
        collectionViewTest1.delegate = self
        
        collectionViewTest2.dataSource = self
        collectionViewTest2.delegate = self
        
        collectionViewTest3.dataSource = self
        collectionViewTest3.delegate = self
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return keywords.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionViewTest1 {
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecentSearchKeywordCell.identifier, for: indexPath) as? RecentSearchKeywordCell else {
                return UICollectionViewCell()
            }
            return cell
        }
        else if collectionView == collectionViewTest2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCell2", for: indexPath)
            
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCell3", for: indexPath)
        
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == collectionViewTest1 {
            let cellWidth = collectionView.frame.width - cv1HorizonInset - cv1RightSpacing
            let cellHeight = (collectionView.frame.height - cv1TopInset - cv1BottomInset - cv1ItemSpacing) / 2
            
            return CGSize(width: cellWidth, height: cellHeight)
        }
        else if collectionView == collectionViewTest2 {
            let cellWidth = (collectionView.frame.width - cv2HorizonInset - cv2RightSpacing - cv2ItemSpacing) / 3
            let cellHeight = collectionView.frame.height - cv2TopInset - cv2BottomInset
            
            return CGSize(width: cellWidth, height: cellHeight)
            
        }
        
        let cellWidth = (collectionView.frame.width - cv3HorizonInset - cv3RightSpacing - cv3ItemSpacing) / 2
        let cellHeight = collectionView.frame.height - cv3TopInset - cv3BottomInset
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        if collectionView == collectionViewTest1 {
            return cv1ItemSpacing
        }
        else if collectionView == collectionViewTest2 {
            return cv2ItemSpacing
        }
        
        return cv3ItemSpacing
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == collectionViewTest1 {
            return cv1LineSpacing
        }
        else if collectionView == collectionViewTest2 {
            return cv2LineSpacing
        }
        
        return cv3LineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == collectionViewTest1 {
            return UIEdgeInsets(top: cv1TopInset, left: cv1HorizonInset, bottom: cv1BottomInset, right: cv1RightSpacing)
        }
        else if collectionView == collectionViewTest2 {
            return UIEdgeInsets(top: cv2TopInset, left: cv2HorizonInset, bottom: cv2BottomInset, right: cv2BottomInset)
        }
        
        return UIEdgeInsets(top: cv3TopInset, left: cv3HorizonInset, bottom: cv3BottomInset, right: cv3HorizonInset)
    }
}
