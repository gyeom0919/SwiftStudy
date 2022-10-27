//
//  TextFieldValidVC.swift
//  RxPractice
//
//  Created by 겸 on 2022/10/31.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

private let minimumTextLength = 5

let disposeBag = DisposeBag()

class TextFieldValiedVC : UIViewController {
    
    @IBOutlet weak var writeSomething: UITextField!
    @IBOutlet weak var isTextValid: UILabel!
    @IBOutlet weak var doSome: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        isTextValid.text = "텍스트는 최소 \(minimumTextLength)글자 이상이여야 합니다."
        
        let textValid = writeSomething.rx.text.orEmpty
            .map { $0.count >= minimumTextLength }
            .share(replay: 1)
        
        textValid
            .bind(to: isTextValid.rx.isHidden)
            .disposed(by: disposeBag)
        
        textValid
            .bind(to: doSome.rx.isEnabled)
            .disposed(by: disposeBag)
        
//        let textIsValid = Observable.combineLatest(textValid) { $0 }
//            .bind(to: doSome.rx.isEnabled)
//            .disposed(by: DisposeBag())
                    
    }
    
}
