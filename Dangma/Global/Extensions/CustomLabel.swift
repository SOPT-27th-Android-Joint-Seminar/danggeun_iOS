//
//  CustomLabel.swift
//  Dangma
//
//  Created by soyounglee on 2020/11/17.
//

import UIKit

// 자간 간격 세팅을 위해서 추가
// storyboard label에서 customlabel class 채택 후
// keypath에 characterSpacing 값을 조절 해주면 됩니다.


open class CustomLabel : UILabel {
    @IBInspectable open var characterSpacing:CGFloat = 1 {
        didSet {
            let attributedString = NSMutableAttributedString(string: self.text!)
            attributedString.addAttribute(NSAttributedString.Key.kern, value: self.characterSpacing, range: NSRange(location: 0, length: attributedString.length))
            self.attributedText = attributedString
        }

    }
}
