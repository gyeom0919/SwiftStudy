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
    @IBOutlet weak var profilePhoto:UIImageView!
    @IBOutlet var doneButton:UIButton!
    
    
        
    var name : String?
    var job : String?

    
    override func viewDidLoad() {
        updateInfo()
        super.viewDidLoad()
        
        if nameLabel.adjustsFontSizeToFitWidth == false {
            nameLabel.adjustsFontSizeToFitWidth = true
        }
        
        printOpened()
        
        /*
         자동으로 버튼 사이즈가 조절되는 코드를 짜보려했지만 실패!
         Expression of type 'CGFloat' is unused <- 오류
        doneButton = UIButton()
        doneButton.intrinsicContentSize.width
        */
    }
    
    func printOpened(){
        print("화면이 열렸습니다.")
    }
    
    func updateInfo() {
        if let name = self.name, let job = self.job {
            
            let img = UIImage(named: "\(name).jpg")
            
            profilePhoto.image = img
            nameLabel.text = name
            jobLabel.text = job
        }
    }
    
    @IBAction func closeView(){
        dismiss(animated: true, completion: nil)
    }
    
    
    // 이미지 클릭시 블러처리하고 상세정보를 나타내는 함수 (기능)
    @IBAction func detailInfo() {
        
    }
    
    
    
    
}
