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
    
    @IBInspectable
    var borderWidth : CGFloat = 0 {
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable
    var borderColor : UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable
    var isCircle : Bool = false {
        didSet {
            if isSquare && isCircle == true {
                self.layer.cornerRadius = self.frame.width / 2
            }
        }
    }
    
    // 커스텀 뷰 안에서만 사용  하는 함수 (fileprivate)
    
    /// 뷰 정사각형 여부
    /// - Returns: 여부
//    fileprivate func isSquare() -> Bool {
//        return self.frame.width == self.frame.height
//    }
    
    fileprivate var isSquare : Bool {
        get {
            return self.frame.width == self.frame.height
        }
    }
    
    
    
}
