//
//  UIFont + Ext.swift
//  CustomLoadingBtn
//
//  Created by 겸 on 2022/10/05.
//

import Foundation
import UIKit

extension UIFont {

    public enum SunflowerType: String {
        case medium = "-Medium"
        case light = "-Light"
        case bold = "-Bold"
    }
    
    // 함수는 기본 값이 중요 !!

    static func Sunflower(_ type: SunflowerType = .light, size: CGFloat = UIFont.systemFontSize) -> UIFont {
        return UIFont(name: "Sunflower\(type.rawValue)", size: size)!
    }


}
