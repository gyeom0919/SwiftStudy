//
//  ViewController.swift
//  RxPractice
//
//  Created by 겸 on 2022/10/24.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    @IBOutlet weak var number1: UITextField!
    @IBOutlet weak var number2: UITextField!
    @IBOutlet weak var number3: UITextField!
    @IBOutlet weak var number4: UITextField!
    
    @IBOutlet weak var result: UILabel!
    
    // 아직 왠지 모르겠지만 이걸 해주지 않으면 바로 적용 안됨
    // 아마 DisposeBag()이 한번만 실행되서 그런듯
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 파이프라인을 연결함
        Observable.combineLatest(
            number1.rx.text.orEmpty,
            number2.rx.text.orEmpty,
            number3.rx.text.orEmpty,
            number4.rx.text.orEmpty) {
                textValue1, textValue2, textValue3, textValue4 -> Int in return
                (Int(textValue1) ?? 0) +
                (Int(textValue2) ?? 0) +
                (Int(textValue3) ?? 0) +
                (Int(textValue4) ?? 0)
            }
            // Int로 바꾼다
            .map { $0.description }
            .bind(to: result.rx.text)
            .disposed(by: disposeBag)
        

    }


}

