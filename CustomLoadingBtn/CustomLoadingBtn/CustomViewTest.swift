//
//  CustomViewTest.swift
//  CustomLoadingBtn
//
//  Created by 겸 on 2022/09/29.
//

import Foundation
import UIKit

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
    }
}

#if DEBUG

import SwiftUI

struct CustomViewTest_Previews: PreviewProvider {
    static var previews: some View {
        CustomViewTest()
            .getPreview()
            .frame(width: 200, height: 200)
//            .padding(10)
//            .background(Color.blue)
            .previewLayout(.sizeThatFits)
    }
}

#endif
