//
//  CurrentTimeViewController.swift
//  StudyAlamofire
//
//  Created by 겸 on 2022/11/09.
//

import Foundation
import UIKit
import Alamofire

class CurrentTimeViewController : UIViewController {
    
    @IBOutlet weak var currentTime: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        currentTime.text = Todo
    }
    
    @IBAction func callCurrentTime(_ sender: Any) {
        
      
        TodoViewModel().fetchTodos()
        
        
    }
    
}
