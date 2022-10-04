//
//  ViewController.swift
//  CustomLoadingBtn
//
//  Created by 겸 on 2022/09/29.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {
    
    // Then 사용 이전 코드
//    lazy var myScrollView : UIScrollView = { // lazy?? (데이터를 나중에 올리게끔)
//        let scrollView = UIScrollView()
//        return scrollView
//    }()
    
    //Then을 사용한 후
    lazy var myScrollView : UIScrollView = UIScrollView().then{
        $0.isUserInteractionEnabled = true
        $0.alwaysBounceVertical = true // 위 아래로
        $0.alwaysBounceHorizontal = false // 세로로만 할 예정
        $0.addSubview(containerView)
//        $0.translatesAutoresizingMaskIntoConstraints = false  // Snapkit으로 인해 사용 X
    }
    
    lazy var containerView : UIView = UIView().then{
        $0.backgroundColor = .systemYellow
        $0.addSubview(buttonStackView)
        
    }
    
    lazy var buttonStackView : UIStackView = UIStackView().then{
        $0.spacing = 10
        $0.alignment = .fill // horizontal 방향으로 꽉차게
        $0.axis = .vertical
        $0.distribution = .fillEqually
        
//        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .systemBlue
        
        setupUI()
    } // viewDidLoad()
    
    
    /// UI 설정
    fileprivate func setupUI() {
        self.view.addSubview(myScrollView)
         
        buttonStackView.snp.makeConstraints{
            $0.edges.equalToSuperview().inset(20) //모서리를 부모 객체에 20만큼 간격
        }
        
        myScrollView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        containerView.snp.makeConstraints{
            $0.width.equalTo(myScrollView.frameLayoutGuide.snp.width)
            $0.edges.equalTo(myScrollView.contentLayoutGuide.snp.edges)
        }
        
        let dummyButtons : [UIButton] = Array(0...20).map{ index in
//            UIButton(configuration: .filled()).then{
//                $0.setTitle("\(index) 버튼", for: .normal)
//            }
            AllignedIconButton(title: "\(index) 버튼")

        }
        
        dummyButtons.forEach{ //반복문
            buttonStackView.addArrangedSubview($0)
        }
        

//        buttonStackView.addArrangedSubview()
    }

}




// SwiftUI를 활용하여 미리보기


#if DEBUG

import SwiftUI

struct ViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewController().getPreview()
//            .ignoresSafeArea()
    }
}

#endif

