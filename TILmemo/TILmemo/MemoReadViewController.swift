//
//  MemoReadViewController.swift
//  TILmemo
//
//  Created by 겸 on 2022/08/23.
//

import UIKit

class MemoReadViewController: UIViewController {
    
    // 콘텐츠 데이터를 저장하는 변수
    var param : MemoData!
    
    @IBOutlet weak var subject : UILabel!
    @IBOutlet weak var contents : UILabel!
    @IBOutlet weak var img : UIImageView!
    
    override func viewDidLoad() {
        
        // 제목, 내용, 이미지 불러오기
        self.subject.text = param.title
        self.contents.text = param.contents
        self.img.image = param.image
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MM월 dd일 HH분에 작성됨"
        let dateString = formatter.string(from: param.tilDate!)
    
        self.navigationItem.title = dateString
    }
}
