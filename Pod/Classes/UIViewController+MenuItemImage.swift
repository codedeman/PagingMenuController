//
//  UIViewController+MenuItemImage.swift
//  PagingMenuController
//
//  Created by Yusuke Kita on 4/29/16.
//  Copyright (c) 2016 kitasuke. All rights reserved.
//

import Foundation

var MenuItemImageKey: UInt8 = 0
var MenuItemDescKey: UInt8 = 1
var MenuItemViewKey: UInt8 = 2
public extension UIViewController {
    var menuItemImage: UIImage? {
        get {
            guard let image = objc_getAssociatedObject(self, &MenuItemImageKey) as? UIImage else { return nil }
            return image
        }
        set {
            objc_setAssociatedObject(self, &MenuItemImageKey, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    var menuItemDesc: String? {
        get {
            guard let desc = objc_getAssociatedObject(self, &MenuItemDescKey) as? String else { return nil }
            return desc
        }
        set {
            objc_setAssociatedObject(self, &MenuItemDescKey, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    var menuItemView: MenuItemView? {
        get {
            guard let menuItemView = objc_getAssociatedObject(self, &MenuItemViewKey) as? MenuItemView else { return nil }
            return menuItemView
        }
        set {
            objc_setAssociatedObject(self, &MenuItemViewKey, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    func updateMenuContent() {
        menuItemView!.titleLabel.text = self.title
        menuItemView!.descLabel.text = self.menuItemDesc
    }
}