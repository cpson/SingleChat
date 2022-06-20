//
//  File.swift
//  
//
//  Created by 손창빈 on 2022/01/14.
//
#if canImport(UIKit)
import Foundation
import UIKit
import InputBarAccessoryView

public class SingleChatViewController: UIViewController {
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var headerViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var singleChatTableView: UITableView!
    
    private let keyboardManager = KeyboardManager()
    public var inputBar: InputBarAccessoryView!
//    public var chatDataItems: 
    
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
    
    @IBAction func sendAction(_ sender: Any) {
        
    }
}

extension SingleChatViewController {
    private func configure() {
        let topPadding = UIApplication.shared.keyWindow?.safeAreaInsets.top ?? 0
        headerViewHeightConstraint.constant = headerViewHeightConstraint.constant + topPadding
        
        inputBarViewConfiguration()
    }
    
    private func inputBarViewConfiguration() {
        inputBar = InputBarAccessoryView()
        inputBar.delegate = self
        inputBar.inputTextView.keyboardType = .twitter
        inputBar.inputTextView.layer.borderWidth = 1
        inputBar.inputTextView.layer.borderColor = UIColor.gray.cgColor
        inputBar.inputTextView.layer.cornerRadius = 15
        inputBar.padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        inputBar.middleContentViewPadding.right = 0
        inputBar.setRightStackViewWidthConstant(to: 40, animated: false)
        
        if let sendImage = SingleChatBundle.SCBundleImage(named: "btnSendOn"), let sendOffImage = SingleChatBundle.SCBundleImage(named: "btnSendOff") {
            inputBar.sendButton.title = nil
            inputBar.sendButton.backgroundColor = .clear
            inputBar.sendButton.setImage(sendImage, for: .normal)
            inputBar.sendButton.setImage(sendOffImage, for: .disabled)
        }
        
        inputBar.backgroundView.backgroundColor = self.view.backgroundColor
        inputBar.backgroundColor = .clear
        inputBar.separatorLine.backgroundColor = .clear
        self.view.addSubview(inputBar)
        
        keyboardManager.bind(inputAccessoryView: inputBar)
        keyboardManager.bind(to: singleChatTableView)
    }
}

extension SingleChatViewController: InputBarAccessoryViewDelegate {
    public func inputBar(_ inputBar: InputBarAccessoryView, didChangeIntrinsicContentTo size: CGSize) {
        singleChatTableView.contentInset.bottom = size.height + 300
    }
}
#endif
