//
//  ViewController.swift
//  StudyAlamofire
//
//  Created by 겸 on 2022/11/08.
//

import UIKit
import Alamofire


class ViewController: UIViewController {
    
    struct DecodableType : Decodable { let url : String}
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        AF.request("https://phplaravel-574671-2962113.cloudwaysapps.com/api/v1/todos?page=1&order_by=desc&per_page=1", method: .get).responseDecodable(of: DecodableType.self) {
            debugPrint("Response : \($0)")
            
            debugPrint("-------")
            
            AF.request("https://phplaravel-574671-2962113.cloudwaysapps.com/api/v1/todos?page=1&order_by=desc&per_page=1", method: .get, encoding: JSONEncoding.default).responseData { response in
//                textLabel.text = response
                debugPrint(response)
            }
        }
    }
    
}

