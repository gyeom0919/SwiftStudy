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
    @IBOutlet weak var getApiBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        let url = "https://dummyjson.com/products/1"
        let header : HTTPHeaders = ["Content-Type": "application/json"]
        
        let dataRequest = AF.request(url, method: .get, encoding: JSONEncoding.default,headers: header)

//        dataRequest.responseDecodable(of: Example.self) { (response) in
//            switch response.result {
//            case .success(let obj):
//                if let nsDictionary = obj as? NSDictionary {
//                    if let title = nsDictionary["title"] as? String {
//                        self.textLabel.text = title
//                    }
//                }
//            case .failure(let e):
//                print(e.localizedDescription)
//            }
//        }
    }
    
    @IBAction func onBtnRequest(_ sender: Any) {
        sendRequest()
    }
    
    func sendRequest() {
        
        let parameter : Parameters = [
        "id" : "2",
        "title" : "whatever",
        "brand" : "Samsung"
        ]
        
        let url = "https://dummyjson.com/products/1"
        let header : HTTPHeaders = ["Content-Type": "application/json"]
        
        AF.request(url, method: .get, parameters: parameter, encoding: URLEncoding.default, headers: header).validate(statusCode: 200..<300).responseJSON(completionHandler : {
            (response) in
            debugPrint(response)
            
            self.parseJson(response)
            
            
        })
    }
    let url = "https://dummyjson.com/products/1"

    let jsonDecoder = JSONDecoder()
//    let data = NSData(contentsOf: NSURL(string: URL!)! as URL)
    
    func parseJson(_ response : AFDataResponse<Any>) {
        switch response.result {
        case .success(_):
//            do{
//                let decoded = try jsonDecoder.decode(Example.self, from: response)
//                print(" \(decoded.id) & \(decoded.title)")
//            }
            
            do {
                let res = try JSONDecoder().decode([Example].self, from: ?)
            }
            self.textLabel.text = "\(response)"
            break
        case .failure(_):
            print("통신 실패", String(describing: response))
            break
            
        }
    }
    
}



