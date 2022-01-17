//
//  SingleChatConfiguration.swift
//  
//
//  Created by 손창빈 on 2022/01/14.
//

#if canImport(UIKit)
import Foundation
import UIKit

internal var SCConfig: SingleChatConfiguration { return SingleChatConfiguration.shared }

public struct SingleChatConfiguration {
    public static var shared: SingleChatConfiguration = SingleChatConfiguration()
    
    public var isDebugLogsEnabled: Bool = true
    
    public init() {}
}
#endif
