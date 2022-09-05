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
        
        postSample()
    }

    
/*  GET 방식
 
    func getTest() {
        let url = "https://jsonplaceholder.typicode.com/todos/1"
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   encoding: URLEncoding.default,
                   headers: ["Content-Type":"application/json", "Accept":"application/json"])
            .validate(statusCode: 200..<300)
            .responseJSON { (json) in
                //응답처리
                print(json)
        }
    }
*/
    
/* GET 방식 2
    func getTest2(){
        let url = "https://jsonplaceholder.typicode.com/todos/1"
        let alam = AF.request(url, method: .get, parameters: nil).validate(statusCode: 200..<300)

        alam.responseJSON() { response in
            switch response.result{
            case .success(let value):
                if let jsonObj = value as? [String: Any]{
                    print("데이터의 갯수: \(jsonObj.count)")
                    if let userId = jsonObj["userId"]{
                        print("userId = \(userId)")
                    }
                    if let id = jsonObj["id"]{
                        print("id = \(id)")
                    }
                    if let title = jsonObj["title"]{
                        print("title = \(title)")
                    }
                    if let completed = jsonObj["completed"]{
                        print("completed = \(completed)")
                    }
                    
                }
            case .failure(let error):
                print("error: \(String(describing: error.errorDescription))")
            }
        }
    
    }
    
    */
    
    /*
    func getUsage() {
        let url = "https://jsonplaceholder.typicode.com/todos/2"
        
        AF.request(url,
                   method: .get,
                   parameters: nil).validate(statusCode: 200..<300)
            .responseJSON{ (json) in print(json)}
    }
     */
    
    // MARK- POST
    
    func postSample() {
        let url = "https://ptsv2.com/t/zccwc-1662373612/post"
        
        var request = URLRequest(url: URL(string: url)!)
        request.method = .post
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.timeoutInterval = 10
        
        // 보낼 정보
        let params = ["id":"아이디" , "pw":"패스워드"] as Dictionary
        
        do {
                   try request.httpBody = JSONSerialization.data(withJSONObject: params, options: [])
               } catch {
                   print("http Body Error")
               }
               AF.request(request).responseString { (response) in
                   switch response.result {
                   case .success:
                       print("POST 성공")
                   case .failure(let error):
                       print("error : \(error.errorDescription!)")
                   }
               }
           }
        
        
}

