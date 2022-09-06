//
//  ViewController.swift
//  CustomCodeSample
//
//  Created by 겸 on 2022/09/06.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let btn = UIButton(type : .system)
        btn.frame = CGRect(x: 50, y: 100, width: 150, height: 30)
        btn.setTitle("Test Buttom", for: .normal)
        
        //Width /2 = 가운데
        btn.center = CGPoint(x: self.view.frame.size.width / 2, y: 100)
        
        // View에 추가
        self.view.addSubview(btn)
        
        btn.addTarget(self, action: #selector(btnOnClick(_:)), for: .allTouchEvents)
        
    }
    
    @objc func btnOnClick(_ sender : Any){
        if let btn = sender as? UIButton{
            btn.setTitle("buttonClicked", for: .normal)
        }
    }
    
    
}

