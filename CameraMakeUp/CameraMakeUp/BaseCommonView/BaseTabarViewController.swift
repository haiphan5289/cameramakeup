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

class BaseTabbarViewController: UITabBarController {
    
    var customTabbar: CustomTabbar!
    
    private let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.setupVar()
        self.setupUI()
        self.loadTabBar()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func setupVar() {
//        setupTabbar()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        let height: CGFloat = tabBar.frame.height + Constant.shared.getHeightSafeArea(type: .bottom)
//        var tabFrame            = tabBar.frame
//        tabFrame.size.height    = height
//        tabFrame.origin.y       = view.frame.size.height - height
//        self.customTabbar.frame            = tabFrame
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
    
//    func setupTabbar() {
//        let homeVC = HomeVC.createVC()
//        self.viewControllers = [homeVC]
//
//        TypeTabbar.allCases.forEach { (type) in
//            if let vc = self.viewControllers?[type.rawValue] {
//                vc.tabBarItem.title = type.text
//            }
//        }
//    }
    
    func loadTabBar() {
        // Tạo và load custom tab bar
        let tabbarItems: [CustomTabbar.TabItem] = [.home, .video]
        
        setupCustomTabMenu(tabbarItems, completion: { viewControllers in
            self.viewControllers = viewControllers
        })
        
        selectedIndex = 0
    }

    func setupCustomTabMenu(_ menuItems: [CustomTabbar.TabItem], completion: @escaping ([UIViewController]) -> Void) {
        // Handle custom tab bar và các attach touch event listener
        let frame = tabBar.frame
        var controllers = [UIViewController]()
        
        // Thêm các view controller tương ứng
        menuItems.forEach({
            controllers.append($0.viewController)
            
            // Khởi tạo custom tab bar
            let customTabbar = CustomTabbarView(menuItems: menuItems, frame: frame)
            customTabbar.backgroundColor = .red
            customTabbar.clipsToBounds = true
            customTabbar.itemTapped = changeTab(tab:)
            self.customTabbar.addSubview(customTabbar)
            
            switch $0 {
            case .home:
                // Auto layout cho custom tab bar
                customTabbar.snp.makeConstraints { make in
                    make.left.top.equalToSuperview()
                    make.height.equalTo(self.customTabbar.frame.height)
                    make.width.equalTo(self.getWidthView())
                }
            case .video:
                // Auto layout cho custom tab bar
                customTabbar.snp.makeConstraints { make in
                    make.right.top.equalToSuperview()
                    make.height.equalTo(self.customTabbar.frame.height)
                    make.width.equalTo(self.getWidthView())
                }
            }
            
        })
        
        completion(controllers)
    }

    func changeTab(tab: Int) {
        self.selectedIndex = tab
    }
    
    private func getWidthView() -> CGFloat {
        let w = ((self.view.frame.width / 2) - Constant.shared.bigRadiusTabbar) / 2
        return w
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        // Handle didSelect viewController method here
    }
}
