//
//  CustomViewTest.swift
//  CustomLoadingBtn
//
//  Created by 겸 on 2022/09/29.
//

import Foundation
import UIKit
import Then
import SnapKit

class CustomViewTest : UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    fileprivate func setupUI(){
        self.backgroundColor = .systemYellow
        let icon = UIImage(systemName: "square.and.arrow.up.fill")
        
        let padding = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        
        let button = AllignedIconButton(title: "버튼", icon: icon, padding: padding)

        self.addSubview(button)
        
        button.snp.makeConstraints{
            $0.top.equalToSuperview().offset(10) // 위에서 10만큼
            $0.horizontalEdges.equalToSuperview().inset(10) // superView로 10만큼
        }

    }
}

#if DEBUG

import SwiftUI

struct CustomViewTest_Previews: PreviewProvider {
    static var previews: some View {
        CustomViewTest()
            .getPreview()
            .frame(width: 250, height: 200)
//            .padding(10)
//            .background(Color.blue)
            .previewLayout(.sizeThatFits)
    }
}

#endif
