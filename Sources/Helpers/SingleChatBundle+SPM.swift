//
//  SingleChatBundle.swift
//  
//
//  Created by 손창빈 on 2022/01/14.
//

#if canImport(UIKit)
import Foundation
import UIKit

public extension Bundle {
    static var singChat: Bundle { .module }
}

open class SingleChatBundle {
    open class func SCBundleImage(named: String) -> UIImage? {
        return UIImage(named: named, in: .module, compatibleWith: nil)
    }
    
    class func bundle() -> Bundle {
        let SCBundle = Bundle.module
        if let url = SCBundle.url(forResource: "Resources", withExtension: "bundle") {
            let bundle = Bundle(url: url)
            return bundle ?? SCBundle
        }
        
        return SCBundle
    }
}
#endif
