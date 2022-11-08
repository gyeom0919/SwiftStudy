//
//  ViewController.swift
//  StudyAlamofire
//
//  Created by 겸 on 2022/11/08.
//

import UIKit
import Alamofire


class ViewController: UIViewController {
    
    struct Example: Codable {
        let id : Int
        let title : String
        let description : String
    }
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        let url = "https://dummyjson.com/products/1"
        let header : HTTPHeaders = ["Content-Type": "application/json"]
        
        let dataRequest = AF.request(url, method: .get, encoding: JSONEncoding.default,headers: header)
//        dataRequest.responseData{
//            debugPrint($0)
//            debugPrint("==================================")
//
//        }
        
        
        dataRequest.responseDecodable(of: Example.self) {
            debugPrint($0)
//            debugPrint("-------ss-------")
//            debugPrint(Example.self)
        }
        
        print(Example.self)
        
    }
}



