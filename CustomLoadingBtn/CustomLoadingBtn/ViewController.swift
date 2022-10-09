//
//  ViewController.swift
//  CustomLoadingBtn
//
//  Created by 겸 on 2022/09/29.
//

import UIKit
import SnapKit
import Then
import Combine
import RxCocoa
import RxSwift

// 메인 뷰 컨트롤러

class ViewController: UIViewController {
    
    // Combine
    @Published var loadingState : LoadingButton.LoadingState = .normal
    
    // Rx
    let loadingStateRx = BehaviorRelay<LoadingButton.LoadingState>(value: .normal)
    
    // Rx 메모리 관리
    let disposeBag = DisposeBag()
    
    // combine 메모리 관리
    var subscriptions = Set<AnyCancellable>()
    
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
        
        let icon = UIImage(systemName: "square.and.arrow.up.fill")
        
//        let dummyButtons : [LoadingButton] = Array(0...20).map{ index in
//            LoadingButton(title: "\(index) 버튼", icon: icon)
//
        let dummyButtons : [LoadingButton] = IndicatorType.allCases.map{
            type in LoadingButton(indicatorType: type,title: type.rawValue, icon: icon)
        }
            
//        }
        
        // for 문 사용되신 반복문
        dummyButtons.forEach{ //반복문
            buttonStackView.addArrangedSubview($0)
            $0.addTarget(self, action: #selector(onButtonClicked(_:)), for: .touchUpInside)
            
            // 데이터를 퍼블리셔로 바꾸기 위해 $
            // 콤바인 퍼블리셔 데이터 상태 <-> 버튼의 loadingState에 연결
            //            self.$loadingState
            //                .assign(to: \.loadingState, on: $0)
            //                .store(in: &subscriptions)
            
            // Rx 옵져버블 (데이터 주고받기 ) 데이터의 상태 <-> 버튼의 loadingState
            self.loadingStateRx
                .bind(to: $0.rx.loadingState)
                .disposed(by: disposeBag)
        }
        
        let loadingStateLabel = UILabel().then{
            $0.text = "로딩상태 라벨"
            $0.font = UIFont.systemFont(ofSize: 30)
            $0.backgroundColor = .white
        }
        
        self.view.addSubview(loadingStateLabel)
        
        loadingStateLabel.snp.makeConstraints{
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            $0.centerX.equalToSuperview()
        }
        
//        // 콤바인
//        self.$loadingState
//            .map{ $0 == .loading ? "로딩중" : "일반"}
//            .assign(to: \.text, on: loadingStateLabel)
//            .store(in: &subscriptions)
//
        // Rx
        self.loadingStateRx
            .map{ $0 == .loading ? "로딩중" : "일반"}
            .bind(to: loadingStateLabel.rx.text)
            .disposed(by: disposeBag)
    }
}




//MARK: - 액션관련
extension ViewController {

    
    /// 버튼 클릭 시
    /// - Parameter sender: 클릭한 버튼
    @objc fileprivate func onButtonClicked(_ sender: LoadingButton){
        
        if self.loadingStateRx.value == .loading {
            return
        }
        
        self.loadingStateRx.accept(.loading)
        
        // 딜레이 주기. 2초
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute:{
            self.loadingStateRx.accept(.normal)
        })

        
//        sender.loadingState = sender.loadingState == .loading ? .normal : .loading
        
//        if sender.loadingState == .loading {
//            sender.loadingState = .normal
//        } else {
//            sender.loadingState = .loading
//        }
        
    }
}




// SwiftUI를 활용하여 미리보기


#if DEBUG

import SwiftUI
import RxRelay

struct ViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewController().getPreview()
            .ignoresSafeArea()
    }
}

#endif

