//
//  AllignedIconButton.swift
//  CustomLoadingBtn
//
//  Created by 겸 on 2022/10/04.
//

import Foundation
import UIKit

class AllignedIconButton : UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("- ")
        
    }
    
    required init?(coder : NSCoder){
        super.init(coder: coder)
    }
    
    convenience init(title : String = "타이틀 없음", bgColor: UIColor = .systemBlue, tintColor : UIColor = .white, radius : CGFloat = 8) { // 생성자 + 매개변수 or 타입
        self.init(type: .system)
        self.setTitle(title, for: .normal) // 외부에서 받은 title
        self.backgroundColor = bgColor // 외부에서 받은 bgColor
        self.tintColor = tintColor // 외부에서 받은 tintColor
        self.layer.cornerRadius = radius
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        print("-")
    }
    
}
