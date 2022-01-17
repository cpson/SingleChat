//
//  File.swift
//  
//
//  Created by 손창빈 on 2022/01/14.
//
#if canImport(UIKit)
import Foundation
import UIKit

public class SingleChatViewController: UIViewController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    deinit {
        
    }
    
    
    
    //MARK: - Actions
    @IBAction func backAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension SingleChatViewController {
    private func configure() {
        
    }
}
#endif
