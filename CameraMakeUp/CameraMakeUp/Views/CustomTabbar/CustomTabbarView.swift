//
//  CustomTabbarView.swift
//  CameraMakeUp
//
//  Created by haiphan on 27/09/2021.
//

import Foundation
import UIKit

class CustomTabbarView: UIView {
    var itemTapped: ((_ tab: Int) -> Void)?
    var activeItem: Int = 0

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    convenience init(menuItems: [CustomTabbar.TabItem], frame: CGRect) {
        self.init(frame: frame)
        // ...
    }

    func createTabItem(item: CustomTabbar.TabItem) -> UIView {
        // ...
        return UIView()
    }

    @objc func handleTap(_ sender: UIGestureRecognizer) {
        // ...
    }

    func switchTab(from: Int, to: Int) {
        // ...
    }

    func activateTab(tab: Int) {
        // ...
    }

    func deactivateTab(tab: Int) {
        // ...
    }
}
