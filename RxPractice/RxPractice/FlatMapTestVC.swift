//
//  FlatMapTestVC.swift
//  RxPractice
//
//  Created by 겸 on 2022/10/26.
//

import UIKit
import RxSwift
import RxCocoa

class FlatMapTestVC: UIViewController {

    @IBOutlet weak var testBtn: UIButton!
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        testBtn
//            .rx
//            .tap
//            .subscribe(onNext: {
//                print(#fileID, #function, #line, "- ")
//            })
//            .disposed(by: disposeBag)
        
        testBtn.rx.tap
            .scan(0) { aNumber, _ -> Int in
                return aNumber + 1
            }
            .flatMapLatest{ tapNumber -> Observable<Int> in
                Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance)
                    .do(onNext: { intervalNumber in
                        print(#line, "tapNumber : \(tapNumber) - intervalNumber : \(intervalNumber)")

                    })
                        }.subscribe(onNext: { intervalNumber in
//                            print(#line, "result intervalNumber : \(intervalNumber)")
                        })
                        .disposed(by: disposeBag)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
