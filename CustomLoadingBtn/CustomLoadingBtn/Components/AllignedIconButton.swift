//
//  AllignedIconButton.swift
//  CustomLoadingBtn
//
//  Created by 겸 on 2022/10/04.
//

import Foundation
import UIKit

class AllignedIconButton : UIButton {
    
    // 아이콘 정렬
    enum IconAllignment{
        case leading
        case trailing
    }
    
    // 기본 정렬 = 왼쪽
    var iconAllignment : IconAllignment = .leading
    
    var padding : UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("- ")
        
    }
    
    required init?(coder : NSCoder){
        super.init(coder: coder)
    }
    
    convenience init(iconAllign : IconAllignment = .leading,
                    title : String = "타이틀 없음",
                     font : UIFont = UIFont.Sunflower(.medium, size: 20), // 기본값은 항상 Sunflowr-Bold
                     bgColor: UIColor = .systemBlue,
                     tintColor : UIColor = .white,
                     radius : CGFloat = 8,
                     icon : UIImage? = nil, // icon이 없을 경우 nil
                     padding : UIEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
    ) { // 생성자 + 매개변수 or 타입
        
        self.init(type: .system)
        self.setTitle(title, for: .normal) // 외부에서 받은 title
        self.titleLabel?.font = font
        self.backgroundColor = bgColor // 외부에서 받은 bgColor
        self.tintColor = tintColor // 외부에서 받은 tintColor
        self.layer.cornerRadius = radius
        self.setImage(icon, for: .normal)
        self.padding = padding
        self.iconAllignment = iconAllign
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        print("-")
        
        switch iconAllignment{
        case .leading: // 왼쪽 이미지 정렬
            allignIconLeading()
        case.trailing: // 오른쪽 이미지 정렬
            allignIconTrailing()
        }
        
        contentEdgeInsets = padding
        
        
    }
       
}

//MARK: - 아이콘 정렬 관련
extension AllignedIconButton {
    
    
    /// 아이콘 왼쪽 정렬
    fileprivate func allignIconLeading(){
        
        let imgWidth = imageView?.frame.width ?? 0

        contentHorizontalAlignment = .left
        let availableSpace = bounds.inset(by: contentEdgeInsets)
        
        let availableWidth = availableSpace.width - imageEdgeInsets.right - (imageView?.frame.width ?? 0) - (titleLabel?.frame.width ?? 0)
        
        let leftPadding = (availableWidth / 2) - (imgWidth / 2)
        
        titleEdgeInsets = UIEdgeInsets(top: 0, left: leftPadding, bottom: 0, right: 0)
    }
    
    
    /// 아이콘 오른쪽 정렬
    fileprivate func allignIconTrailing(){
        
        let imgWidth = imageView?.frame.width ?? 0
        
        semanticContentAttribute = .forceRightToLeft
        contentHorizontalAlignment = .right
        let availableSpace = bounds.inset(by: contentEdgeInsets)
        let availableWidth = availableSpace.width - imageEdgeInsets.left - (imageView?.frame.width ?? 0) - (titleLabel?.frame.width ?? 0)
        
        let rightPadding = (availableWidth / 2) - (imgWidth / 2)
        
        titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: rightPadding)
        
    }
}
