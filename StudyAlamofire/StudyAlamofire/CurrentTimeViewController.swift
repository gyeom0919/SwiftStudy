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
    }
    
    @IBAction func callCurrentTime(_ sender: Any) {
        
        //        DispatchQueue.main.async() {
        //            do {
        //                let url = URL(string: "http://swiftapi.rubypaper.co.kr:2029/practice/currentTime")
        //
        //                let response = try String(contentsOf: url!)
        //
        //                self.currentTime.text = response
        //                self.currentTime.sizeToFit()
        //            }catch let e as NSError {
        //                print(e.localizedDescription)
        //            }
        //        }
        //    }
        
        let url = "http://swiftapi.rubypaper.co.kr:2029/practice/currentTime"
        AF.request(url, encoder: JSONEncoding.default)
        
        
    }
    
}
