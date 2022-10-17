//
//  ViewController.swift
//  StackView
//
//  Created by 겸 on 2022/10/12.
//

import UIKit
import SnapKit

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
        
        
        
        topStackView.snp.makeConstraints{
            // 크기
            // 위치
            $0.top.equalToSuperview().offset(100)
            $0.centerX.equalToSuperview()
            $0.left.equalToSuperview().offset(20)
        }
        
        print(#function)
        
        let secondStackView = generateSecondStackView()
       
        self.view.addSubview(secondStackView)
        
        NSLayoutConstraint.activate([
            secondStackView.leadingAnchor.constraint(equalTo: topStackView.leadingAnchor),
            secondStackView.trailingAnchor.constraint(equalTo: topStackView.trailingAnchor),
            secondStackView.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: 20)
        ])
        
        let thirdStackView = generateKaKaoStackView()
        
        self.view.addSubview(thirdStackView)

        NSLayoutConstraint.activate([
            thirdStackView.leadingAnchor.constraint(equalTo: secondStackView.leadingAnchor),
            thirdStackView.trailingAnchor.constraint(equalTo: secondStackView.trailingAnchor),
            thirdStackView.topAnchor.constraint(equalTo: secondStackView.bottomAnchor, constant: 20)
        ])
        
    }
}


//MARK: - View 관련
extension ViewController {
    
    /// 두번째 스택뷰 생성
    /// - Returns: 생성된 스택뷰
    fileprivate func generateKaKaoStackView() -> UIStackView {
        
        let firstLabel = UILabel()
        firstLabel.text = "내 카카오 뱅크 입출금 통장"
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let secondLabel = UILabel()
        secondLabel.text = "젤리 교환소"
        secondLabel.font = UIFont.systemFont(ofSize: 12)
        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let trailingImgView = UIImageView()
        trailingImgView.image = UIImage(systemName: "pencil.line")
        trailingImgView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            trailingImgView.widthAnchor.constraint(equalToConstant: 20),
            trailingImgView.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        let secondStackView : UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [
                firstLabel,
                secondLabel,
                trailingImgView
            ])
            stackView.spacing = 5
            stackView.alignment = .center
            stackView.axis = .horizontal
            stackView.distribution = .equalCentering // 아이템 정가운데로
            stackView.backgroundColor = UIColor.systemYellow
            stackView.isLayoutMarginsRelativeArrangement = true // Padding 넣기
            stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
            stackView.layer.borderColor = UIColor.systemBlue.cgColor
            stackView.layer.borderWidth = 2
            stackView.layer.cornerRadius = 10
            stackView.translatesAutoresizingMaskIntoConstraints = false
            return stackView
        }()
        
        return secondStackView
    }
    
    /// 두번째 스택뷰 생성
    /// - Returns: 생성된 스택뷰
    fileprivate func generateSecondStackView() -> UIStackView {
        
        let leadingImgView = UIImageView()
        leadingImgView.image = UIImage(systemName: "pencil.line")
        leadingImgView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            leadingImgView.widthAnchor.constraint(equalToConstant: 50),
            leadingImgView.heightAnchor.constraint(equalToConstant: 50)
        ])
            
        let centerLabel = UILabel()
        centerLabel.text = "젤리 교환소"
        centerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let trailingImgView = UIImageView()
        trailingImgView.image = UIImage(systemName: "pencil.line")
        trailingImgView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            trailingImgView.widthAnchor.constraint(equalToConstant: 50),
            trailingImgView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        let secondStackView : UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [
                leadingImgView,
                centerLabel,
                trailingImgView
            ])
            stackView.spacing = 0
            stackView.alignment = .center
            stackView.axis = .horizontal
            stackView.distribution = .equalCentering // 아이템 정가운데로
            stackView.backgroundColor = UIColor.systemYellow
            stackView.isLayoutMarginsRelativeArrangement = true // Padding 넣기
            stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
            stackView.layer.borderColor = UIColor.systemBlue.cgColor
            stackView.layer.borderWidth = 2
            stackView.layer.cornerRadius = 10
            stackView.translatesAutoresizingMaskIntoConstraints = false
            return stackView
        }()
        return secondStackView
    }
    
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
            .ignoresSafeArea()
    }
}

#endif

