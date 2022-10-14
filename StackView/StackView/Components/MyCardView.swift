//
//  MyCardView.swift
//  uikit-codebase-ui
//
//  Created by Jeff Jeong on 2022/08/17.
//

import Foundation
import UIKit

class MyCardView : UIView {
    
    // View의 생성 조건 frame
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
        print("MyCardView - init()")
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    /// 레이아웃 셋업
    fileprivate func setupLayout() {
        self.backgroundColor = UIColor.systemYellow
        self.translatesAutoresizingMaskIntoConstraints = false
        
        // 메인 타이틀 설정
        let titleLabel = UILabel()
        titleLabel.text = "사운드\n 테라피"
        titleLabel.numberOfLines = 0 // 0은 무제한
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        // 서브 타이틀 설정
        let subtitleLabel = UILabel()
        subtitleLabel.text = "무료"
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let subtitleLabelBg = UIView()
        subtitleLabelBg.backgroundColor = UIColor.systemMint
        subtitleLabelBg.translatesAutoresizingMaskIntoConstraints = false
        
        subtitleLabelBg.addSubview(subtitleLabel)
        
        NSLayoutConstraint.activate([
            subtitleLabel.centerXAnchor.constraint(equalTo: subtitleLabelBg.centerXAnchor),
            subtitleLabel.centerYAnchor.constraint(equalTo: subtitleLabelBg.centerYAnchor),
            subtitleLabel.topAnchor.constraint(equalTo: subtitleLabelBg.topAnchor, constant: 5),
            subtitleLabel.leadingAnchor.constraint(equalTo: subtitleLabelBg.leadingAnchor, constant: 5)
        ])
        
        // 이미지 뷰
        let bottomImageView = UIImageView(image: UIImage(systemName: "person.circle.fill"))
        bottomImageView.translatesAutoresizingMaskIntoConstraints = false
        bottomImageView.contentMode = .scaleToFill
        
        NSLayoutConstraint.activate([
            bottomImageView.widthAnchor.constraint(equalToConstant: 50),
            bottomImageView.heightAnchor.constraint(equalToConstant: 50)
            
        ])
        
        // self에 대한 하위요소 추가
        //        self.view.addSubview(self)
        self.addSubview(titleLabel)
        self.addSubview(subtitleLabelBg)
        self.addSubview(bottomImageView)
        
        // first 뷰에 대한 요소들 위치 잡기
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 200),
            
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            subtitleLabelBg.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            subtitleLabelBg.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            bottomImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            bottomImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
    }
    

}


//MARK: - 스태틱 메소드 관련
extension MyCardView {
    
    
    /// 카드뷰 만들기
    /// - Returns: 만들어진 카드뷰
    static func generateMyCardView() -> MyCardView {
        let card = MyCardView()
        card.translatesAutoresizingMaskIntoConstraints = false
        return card
    }
}
