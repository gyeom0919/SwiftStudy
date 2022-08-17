//
//  DetailViewController.swift
//  InmagoEmployment
//
//  Created by 겸 on 2022/08/15.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel:UILabel!
    @IBOutlet weak var jobLabel:UILabel!
    
    var name : String?
    var job : String?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if nameLabel.adjustsFontSizeToFitWidth == false {
            nameLabel.adjustsFontSizeToFitWidth = true
        }
        
        printOpened()
    }
    
    func printOpened(){
        print("화면이 열렸습니다.")
    }
    
}
