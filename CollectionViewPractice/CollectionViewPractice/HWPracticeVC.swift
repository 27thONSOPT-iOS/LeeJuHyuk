////
////  HWPracticeVC.swift
////  CollectionViewPractice
////
////  Created by 이주혁 on 2020/11/11.
////
//
//import UIKit
//
//class HWPracticeVC: UIViewController {
//
//    @IBOutlet var layoutCollectionView: UICollectionView!
//    
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        layoutCollectionView.dataSource = self
//        layoutCollectionView.delegate = self
//        // Do any additional setup after loading the view.
//    }
//}
//
//extension HWPracticeVC: UICollectionViewDataSource {
//    
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 2
//    }
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        
//        if section == 0 {
//            return 1
//        }
//        
//        return 10
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        
//        if indexPath.section == 0 {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeaderCell", for: indexPath)
//            
//            return cell
//        }
//        
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCell", for: indexPath)
//        
//        return cell
//        
//    }
//    
//}
//
//extension HWPracticeVC: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        print(indexPath)
//        if indexPath.section == 0 {
//            return CGSize(width: collectionView.frame.width, height: 420)
//        }
//        
//        
//        let newWidth: CGFloat = (collectionView.frame.width - 2*horizonInset - itemSpacing) / 2
//        let newHeight: CGFloat = 225.0
//        
//        return CGSize(width: newWidth, height: newHeight)
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        
//        if section == 0 {
//            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//        }
//        
//        return UIEdgeInsets(top: topInset, left: horizonInset, bottom: bottomInset, right: horizonInset)
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        if section == 0 {
//            return 0
//        }
//        return lineSpacing
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        if section == 0 {
//            return 0
//        }
//        return itemSpacing
//    }
//}
