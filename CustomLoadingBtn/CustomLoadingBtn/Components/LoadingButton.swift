//
//  LoadingButton.swift
//  CustomLoadingBtn
//
//  Created by 겸 on 2022/10/05.
//


import Foundation
import UIKit

class LoadingButton : UIButton {
    
    
    // 로딩 상태
    enum LoadingState {
        case normal
        case loading
    }
    
    // 아이콘 정렬
    enum IconAllignment{
        case leading
        case trailing
    }
      
    
    /// 로딩 상태
    var loadingState : LoadingState = .normal {
        didSet{
            DispatchQueue.main.async {
                switch self.loadingState {
                case .normal : self.hideLoading()
                case .loading : self.showLoading()
                }
            }
        }
    }
    
    var indicatorType : IndicatorType = .sysDefault
    
     var indicator : UIView? = nil
    
    var indicatorColor : UIColor = .gray
    
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
    
    convenience init(indicatorType : IndicatorType = .sysDefault,
                    iconAllign : IconAllignment = .leading,
                    title : String = "타이틀 없음",
                     font : UIFont = UIFont.Sunflower(.medium, size: 20), // 기본값은 항상 Sunflowr-Bold
                     bgColor: UIColor = .systemBlue,
                     tintColor : UIColor = .white,
                     radius : CGFloat = 8,
                     icon : UIImage? = nil, // icon이 없을 경우 nil
                     padding : UIEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
    ) { // 생성자 + 매개변수 or 타입
        self.init(type: .system)
        self.indicatorType = indicatorType
        self.setTitle(title, for: .normal) // 외부에서 받은 title
        self.titleLabel?.font = font
        self.backgroundColor = bgColor // 외부에서 받은 bgColor
        self.tintColor = tintColor // 외부에서 받은 tintColor
        self.indicatorColor = tintColor
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

//MARK: - 아이콘 정렬 관련 cmd + option + 방향키
extension LoadingButton {
    
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

//MARK: - 로딩 관련
extension LoadingButton{
    
    
    /// 로딩 숨기기
    fileprivate func hideLoading() {
        
        // 로딩 아닐 시 다시 터치 활성화
        self.isUserInteractionEnabled = true
        
        self.indicator?.alpha = 0
        
        UIView.transition(with: self, duration: 0.2,
                          options: .curveEaseIn,
                          animations: {
            self.titleLabel?.alpha = 1
            self.imageView?.alpha = 1
            self.indicator?.alpha = 0
        })
    }
    
    
    /// 로딩 보여주기
    fileprivate func showLoading() {
        
        //로딩을 보여줄 시 터치 불가능
        self.isUserInteractionEnabled = false
        
        // indicator가 없으면 만들어서 넣기
        if indicator == nil {
            
            let myIndicator = indicatorType.getIndicator(self.indicatorColor)
            myIndicator.transform = CGAffineTransform(scaleX: 0.8, y: 0.8) // indicator의 사이즈 변경
            myIndicator.startAnimating()
            
//            let myIndicator = UIActivityIndicatorView(style: .medium).then{
//                $0.color = .white
//                $0.startAnimating()
//            }
            self.addSubview(myIndicator)
            myIndicator.snp.makeConstraints{
                $0.center.equalToSuperview()
            }
            self.indicator = myIndicator
        }
        
        self.titleLabel?.alpha = 0 // 타이틀 값 0 (히든)
        self.imageView?.alpha = 0 // 이미지 히
        
        UIView.transition(with: self, duration: 0.2,
                          options: .curveEaseOut,
                          animations: {
            self.titleLabel?.alpha = 0 // 타이틀 값 0 (히든)
            self.imageView?.alpha = 0 // 이미지 히든
            self.indicator?.alpha = 1
        })
        
        
         
    }
}
