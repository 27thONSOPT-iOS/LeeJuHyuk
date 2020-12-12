//
//  TabBarC.swift
//  SOPT27-iOS-4th-Assignment
//
//  Created by 이주혁 on 2020/11/20.
//

import UIKit

class TabBarC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabs()
        // Do any additional setup after loading the view.
    }
    
    
    func setTabs() {
        let homeSB = UIStoryboard(name: "Home", bundle: nil)
        let soptworkingSB = UIStoryboard(name: "Networking", bundle: nil)
        
        guard let homeTab = homeSB.instantiateViewController(identifier: "HomeVC") as? HomeVC,
              let soptworkingTab = soptworkingSB.instantiateViewController(identifier: "NetworkingVC") as? NetworkingVC else {
            return
        }
        
        
        homeTab.tabBarItem.title = "Home"
        // Xcode에서 UIImage는 렌더링 과정을 거쳐 이미지위에 tint color 등의 효과를 줄 수 있도록 한다.
        // 따라서 이러한 효과를 주지 않기 위해서는 Original Image로 렌더링이 되도록 해야 한다.
        
        homeTab.tabBarItem.image = UIImage(systemName: "house")
        
        homeTab.tabBarItem.selectedImage = UIImage(systemName: "pencil")?.withRenderingMode(.alwaysOriginal)
        
        soptworkingTab.tabBarItem.title = "SOPT+WORKING"
        soptworkingTab.tabBarItem.image = UIImage(systemName: "paperplane")
        
        self.setViewControllers([homeTab, soptworkingTab], animated: true)
    }

}
