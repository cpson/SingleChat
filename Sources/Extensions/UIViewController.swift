//
//  UIViewController.swift
//  
//
//  Created by 손창빈 on 2022/01/17.
//

#if canImport(UIKit)
import Foundation
import UIKit

public protocol SingleChatStoryBoardInstant { }
 
extension UIViewController : SingleChatStoryBoardInstant {}

extension SingleChatStoryBoardInstant where Self : UIViewController {
    public static func instantiateWithUIViewController(withStoryboard storyboard: String = "SingleChat") -> Self? {
        let storyboard = UIStoryboard(name: storyboard, bundle: Bundle.singChat)
        return storyboard.instantiateViewController(withIdentifier: String(describing: self)) as? Self
    }
}

extension SingleChatStoryBoardInstant where Self : UIViewController {
    public static func instantiateWithUINavigationController(withStoryboard storyboard: String = "SingleChat") -> UINavigationController? {
        let storyboard = UIStoryboard(name: storyboard, bundle: Bundle.singChat)
        let vc = storyboard.instantiateViewController(withIdentifier: String(describing: self))
        return UINavigationController(rootViewController: vc)
    }
}
#endif
