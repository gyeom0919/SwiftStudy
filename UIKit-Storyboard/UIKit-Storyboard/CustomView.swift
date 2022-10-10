//
//  CustomView.swift
//  UIKit-Storyboard
//
//  Created by 겸 on 2022/10/11.
//

import Foundation
import UIKit

// IBDesignable | 인터페이스 빌더에서 디자인으로 확인 가능
@IBDesignable
class CustomView : UIView {
    
    @IBInspectable
    var cornerRadius : CGFloat = 0 {
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
}
