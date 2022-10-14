//
//  ViewController.swift
//  StackView
//
//  Created by 겸 on 2022/10/12.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var topStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually // 동등하게 채우기
//        stackView.backgroundColor = .systemRed
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.white
        
        
//        let firstCardView = MyCardView()
        topStackView.addArrangedSubview(MyCardView.generateMyCardView())
        topStackView.addArrangedSubview(MyCardView.generateMyCardView())
        topStackView.addArrangedSubview(MyCardView.generateMyCardView())

        // 서브 뷰로 추가
        self.view.addSubview(topStackView)
        
        
        // 위치 잡기
        NSLayoutConstraint.activate([
            topStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            topStackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            topStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20)
        ])
        
        
        print(#function)
    }
}

//MARK: - View 관련
extension ViewController {
    
    fileprivate func generateMyCardView() -> MyCardView {
        let card = MyCardView()
        card.translatesAutoresizingMaskIntoConstraints = false
        return card
    }
    
    /// 카드 뷰 생성 및 반환
    /// - Returns: 카드 뷰 반환
    fileprivate func generateCardView() -> UIView {
        
        let containerView = UIView()
        containerView.backgroundColor = UIColor.systemYellow
        containerView.translatesAutoresizingMaskIntoConstraints = false
         
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
        
        // containerView에 대한 하위요소 추가
//        self.view.addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(subtitleLabelBg)
        containerView.addSubview(bottomImageView)
        
        // first 뷰에 대한 요소들 위치 잡기
        NSLayoutConstraint.activate([
            containerView.heightAnchor.constraint(equalToConstant: 200),
            
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            
            subtitleLabelBg.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            subtitleLabelBg.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            bottomImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),
            bottomImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20)
        ])
        
        return containerView
    }
}

#if DEBUG

import SwiftUI

struct ViewControllerPresentable: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        ViewController()
    }
}


struct ViewControllerPrepresentable_PreviewProvider : PreviewProvider {
    static var previews: some View {
        ViewControllerPresentable()
            .previewDevice("iPhone 12 mini")
            .previewDisplayName("iPhone 12 mini")
            .ignoresSafeArea()
    }
}

#endif
