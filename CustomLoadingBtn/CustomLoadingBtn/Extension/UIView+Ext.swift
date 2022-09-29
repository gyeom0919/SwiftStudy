//
//  UIView+Ext.swift
//  CustomLoadingBtn
//
//  Created by 겸 on 2022/09/29.
//

import Foundation
import UIKit

#if DEBUG
import SwiftUI

extension UIView {
    
    private struct ViewRepresentable : UIViewRepresentable {
        
        let uiview : UIView
        
        func updateUIView(_ uiView: UIViewType, context: Context) {
        }
        
        func makeUIView(context: Context) -> some UIView {
            return uiview
        }
        
    }
    func getPreview() -> some View {
        ViewRepresentable(uiview: self)
    }
}


#endif
