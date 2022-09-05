//
//  ViewController.swift
//  TestAlamofire
//
//  Created by 겸 on 2022/09/05.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        getSample()
    }
    
    struct sample : Codable {
        let userID : Int?
        let title : String?
        let id : Int?
        let completed : Bool?
        
        init(completed : Bool, id : Int, title : String, userID : Int){
            self.userID = userID
            self.title = title
            self.id = id
            self.completed = completed
        }
    }
    
    func getSample() {
        
        let url = "https://jsonplaceholder.typicode.com/todos/1"
        
        let request = AF.request(url)
        
        request.responseJSON { (data) in print(data)
            
            
        }
    }
    
}

