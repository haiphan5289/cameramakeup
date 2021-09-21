//
//  BaseTabarViewController.swift
//  Ayofa
//
//  Created by Admin on 3/5/20.
//  Copyright © 2020 ThanhPham. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import SnapKit

enum TypeTabbar: Int, CaseIterable {
    case home
    case audio
//    case video
    
//    var image: UIImage? {
//        switch self {
//        case .home:
//            return Asset.homeActive.image
//        case .audio:
//            return Asset.icAudioHome.image
//        case .video:
//            return Asset.icVideoHome.image
//        }
//    }
//
//    var text: String {
//        switch self {
//        case .home:
//            return L10n.Tabbar.hometext
//        case .audio:
//            return L10n.Tabbar.audiotext
//        case .video:
//            return L10n.Tabbar.videotext
//        }
//    }
    
}

class BaseTabbarViewController: UITabBarController {
    
    var customTabbar: CustomTabbar!
    
    private let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.setupVar()
        self.setupUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func setupVar() {
        setupTabbar()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
//        var bottomSafeArea: CGFloat = 5
//
//        if #available(iOS 11.0, *) {
//            if view.safeAreaInsets.bottom > 0 {
//                bottomSafeArea = 10
//            }
//
//        }
//
//        let height: CGFloat = tabBar.frame.height + bottomSafeArea
//        var tabFrame            = tabBar.frame
//        tabFrame.size.height    = height
//        tabFrame.origin.y       = view.frame.size.height - height
//        tabBar.frame            = tabFrame
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//        guard let listTabbar = self.tabBar.items else {
//            return
//        }
//        
//        listTabbar.enumerated().forEach { (tabbar) in
//            if let type = TypeTabbar(rawValue: tabbar.offset) {
//                if tabbar.element == item {
//                    tabbar.element.image = type.imageActive
//                } else {
//                    tabbar.element.image = type.image
//                }
//            }
//        }
        
    }
    
    func setupUI() {
//        self.tabBar.isTranslucent = false
//        UITabBar.appearance().tintColor = Asset.color1.color
        UITabBar.appearance().barTintColor = TABBAR_COLOR
//        self.view.backgroundColor = Asset.colorApp.color
        let frame = self.tabBar.frame
        self.tabBar.isHidden = true
        self.customTabbar = CustomTabbar(frame: frame)
        self.view.addSubview(self.customTabbar)
    }
    
    func setupTabbar() {
//        let homeVC = HomeVC(nibName: "HomeVC", bundle: nil)
//        let audioVC = LibraryVC.createVC()
//        let videoVC = VideoVC.createVC()
//        self.viewControllers = [homeVC, audioVC, videoVC]
//        
//        TypeTabbar.allCases.forEach { (type) in
//            if let vc = self.viewControllers?[type.rawValue] {
//                vc.tabBarItem.title = type.text
//                vc.tabBarItem.image = type.image
//            }
//        }
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        // Handle didSelect viewController method here
    }
}
