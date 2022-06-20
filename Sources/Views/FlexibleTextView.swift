//
//  UITextView.swift
//  
//
//  Created by 손창빈 on 2022/01/17.
//

#if canImport(UIKit)
import Foundation
import UIKit

class FlexibleTextView: UITextView {
    
    private var _originalTextViewHeight: CGFloat = 0
    private var _textViewHeight: CGFloat = 0
    private var _textViewPaddingValue: CGFloat = 0
    private var _maxContentHeight: CGFloat? = nil
    
    func useRoundEdgeUI() {
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGray.cgColor
        layer.cornerRadius = 15
        textContainerInset = UIEdgeInsets(top: textContainerInset.top, left: 10, bottom: textContainerInset.bottom, right: 10)
    }
    
    func enableFlexibleView(maxLine: CGFloat) {
        _textViewHeight = contentSize.height
        _originalTextViewHeight = self.superview?.frame.height ?? 0
        _textViewPaddingValue = frame.height - _textViewHeight
        _maxContentHeight = _textViewHeight * maxLine + _textViewPaddingValue
    }
    
    func resizeView() -> CGFloat? {
        if contentSize.height > _originalTextViewHeight {
            if contentSize.height > _maxContentHeight ?? 0 {
                return _maxContentHeight
            } else {
                return contentSize.height + _textViewPaddingValue
            }
        } else {
            return _originalTextViewHeight
        }
    }
}

#endif
