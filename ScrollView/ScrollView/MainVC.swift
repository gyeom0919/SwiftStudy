//
//  MainVC.swift
//  ScrollView
//
//  Created by 겸 on 2022/10/19.
//

import Foundation
import UIKit
import Fakery
import Then
import SnapKit


class MainVC : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        let faker = Faker(locale: "ko")
        
        let contentLabel = UILabel().then{
            $0.numberOfLines = 0
            $0.text = faker.lorem.paragraphs(amount: 100)
        }
        
        let containerView = UIView().then {
            $0.backgroundColor = UIColor.systemYellow
            $0.addSubview(contentLabel)
        }
        
        contentLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.left.equalTo(containerView.snp.left).offset(20)
            $0.top.equalTo(containerView.snp.top).offset(20)
        }
        
        let scrollView = UIScrollView().then{
            $0.alwaysBounceVertical = true
            $0.isUserInteractionEnabled = true // 터치 활성화
            $0.addSubview(containerView)
        }
        
        self.view.addSubview(scrollView)
        
        containerView.snp.makeConstraints {
            $0.top.equalTo(scrollView.contentLayoutGuide.snp.top)
            $0.bottom.equalTo(scrollView.contentLayoutGuide.snp.bottom)
            $0.left.equalTo(scrollView.contentLayoutGuide.snp.left)
            $0.right.equalTo(scrollView.contentLayoutGuide.snp.right)
            $0.width.equalTo(scrollView.frameLayoutGuide.snp.width).multipliedBy(1)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(self.view.snp.top)
            $0.bottom.equalTo(self.view.snp.bottom)
            $0.left.equalTo(self.view.snp.left)
            $0.right.equalTo(self.view.snp.right)
            $0.width.equalTo(self.view.snp.width).multipliedBy(1)
        }
        
    }
    
}

#if DEBUG

import SwiftUI

struct MainVCPresentable: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        MainVC()
    }
}


struct MainVCPrepresentable_PreviewProvider : PreviewProvider {
    static var previews: some View {
        MainVCPresentable()
            .ignoresSafeArea()
    }
}

#endif

