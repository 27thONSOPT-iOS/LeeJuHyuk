//
//  NetworkingVC.swift
//  SOPT27-iOS-4th-Assignment
//
//  Created by 이주혁 on 2020/12/12.
//

import UIKit

// Color Asset

class NetworkingVC: UIViewController {
    
    // MARK 주석을 사용하면 코드 미니맵에 표시가 되어 코드가 길어진 경우에도 빠르게 원하는 코드를 찾을 수 있고 가독성이 높아진다.
    
    // MARK:- IBOutlet
    @IBOutlet var networkingCollectionView: UICollectionView! {
        // 프로퍼티 옵저버
        // 해당 변수가 업데이트 될 때 바다 didSet 으로 설정된 코드 블록이 생성된다.
        // 이와 비슷한 것 중 'willSet' 이 있다.
        didSet {
            networkingCollectionView.delegate = self
            networkingCollectionView.dataSource = self
        }
    }
    
    @IBOutlet var navigationView: UIView!
    @IBOutlet var writeProfileButton: UIButton!
    
    // 스토리 보드상에서 AutoLayout 또한 IBOutlet으로 참조가 가능하다.
    @IBOutlet var navigationTopConstraint: NSLayoutConstraint!
    
    // MARK:- Member
    var itemSpacing: CGFloat = 27.0
    let topInset: CGFloat = 41.0
    let bottomInset: CGFloat = 12.0
    var horizontalInset: CGFloat = 24
    
    var leaders: [PartMember] = []
    
    // MARK:- Lifecycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setData()
        initLayout()
    }
    // MARK:- Member Method
    func setData() {
        leaders.append(contentsOf: [
            PartMember(imageName: "juhyeok", name: "이주혁", hashtag: "#hereis#아요#내꿈은#사과농장#ENFP"),
            PartMember(imageName: "juhyeok", name: "이주혁", hashtag: "#hereis#아요#내꿈은#사과농장#ENFP"),
            PartMember(imageName: "juhyeok", name: "이주혁", hashtag: "#hereis#아요#내꿈은#사과농장#ENFP"),
            PartMember(imageName: "juhyeok", name: "이주혁", hashtag: "#hereis#아요#내꿈은#사과농장#ENFP"),
            PartMember(imageName: "juhyeok", name: "이주혁", hashtag: "#hereis#아요#내꿈은#사과농장#ENFP"),
            PartMember(imageName: "juhyeok", name: "이주혁", hashtag: "#hereis#아요#내꿈은#사과농장#ENFP"),
            PartMember(imageName: "juhyeok", name: "이주혁", hashtag: "#hereis#아요#내꿈은#사과농장#ENFP"),
            PartMember(imageName: "juhyeok", name: "이주혁", hashtag: "#hereis#아요#내꿈은#사과농장#ENFP")
        ])
    }
    
    func initLayout() {
        // Extension의 활용
        // Swift에는 Extension을 통해 기존 타입의 확장이 가능하다.
        // 여기서 makeRounded 함수는 UIView 타입의 확장을 통해 정의한 메소드
        writeProfileButton.makeRounded(cornerRadius: 5)
    }
    // MARK:- IBAction Method
}


// MARK:- Extensions
// MARK: UICollectionViewDelegate
extension NetworkingVC: UICollectionViewDelegate {
    
}
// 헤더뷰를 사용하지 않고 다르게 구현하는 방법

// MARK: UICollectionViewDataSource
extension NetworkingVC: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // 섹션을 두개로 구분
        // 섹션마다 다른 셀을 구성하도록하여
        // 보여주는 방법
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        }
        
        return leaders.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCVCell.identifier, for: indexPath) as? BannerCVCell else {
                return UICollectionViewCell()
            }
            
            return cell
        }
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PartMemberCVCell.identifier, for: indexPath) as? PartMemberCVCell else {
            return UICollectionViewCell()
        }
        
        return cell
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension NetworkingVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // CollectionView의 구현에서 격자형 레이아웃을 구성할 때 코드를 통해 레이아웃을 구성하게 됩니다.
        // 화면대응을 하기 위해서는 고정 크기를 주는 것보다는 셀사이의 간격 등에 집중하여 셀을 구성하는 것이 좋다.
        if indexPath.section == 0 {
            return CGSize(width: collectionView.frame.width, height: 420)
        }
        
        return CGSize(width: (collectionView.frame.width - 2*horizontalInset - itemSpacing) / 2,
                      height: 225)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        return itemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 0 {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        
        return UIEdgeInsets(top: topInset, left: horizontalInset, bottom: bottomInset + 88, right: horizontalInset)
    }
}


// 스크롤 이벤트
// MARK: UIScrollViewDelegate
extension NetworkingVC: UIScrollViewDelegate {
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        // 기존의 세미나에서는 애니메이션을 구현할 때 transform 을 이용
        // transform은 오토레이아웃의 영향을 받지 않기 때문에 두개의 요소가 상호작용하는 경우에는 표현이 어렵다.
        // 오토레이아웃의 코드를 직접 조정하여 애니메이션을 줄 수 있다.
        
        navigationTopConstraint.constant = -self.navigationView.bounds.height
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
            //  레이아웃을 즉시 업데이트하는 함수
            // https://nsios.tistory.com/68
        }
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        navigationTopConstraint.constant = 0
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
}
