//
//  MemoWriteViewController.swift
//  TILmemo
//
//  Created by 겸 on 2022/08/23.
//

import UIKit

class MemoWriteViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate {
    
    // 제목을 정하는 subject
    var subject : String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.contents.delegate = self
    }
    
    // 사용자가 텍스트를 입력하면 메소드 호출
    func textViewDidChange(_ textView: UITextView) {
        // 내용의 15자리까지 읽어 -> subject 변수에 저장
        let contents = textView.text as NSString
        // Why NSString? <- String을 사용하면 .length를 사용하지 못함
        // 삼항연산자 [ 조건 ? 참 : 거짓 ]
        let length = ( (contents.length > 15 ) ? 15 : contents.length)
        self.subject = contents.substring(with: NSRange ( location : 0, length : length) )
        
        // 타이틀에 표시한다
        self.navigationItem.title = self.subject
    }
    
    
    
    @IBAction func pickPhoto(_ sender: Any) {
        let imagePick = UIImagePickerController()
        
        imagePick.delegate = self
        imagePick.allowsEditing = true
        
        self.present(imagePick, animated: true)
    }
    
    // 이미지를 선택하면 호출되는 메소드
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // 선택된 이미지를 미리보기에 출력하는 코드
        self.preview.image = info[.editedImage] as? UIImage
        
        // 이미지 피커 컨트롤러를 닫는다
        picker.dismiss(animated: false)
    }
    

    
    @IBAction func saveMemo(_ sender: Any) {
        // 내용 미입력시 경고
        guard self.contents.text?.isEmpty == false else {
            let alert = UIAlertController(title:nil,message: "내용을 입력해주세요", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
            return
        }
        
        let data = MemoData()
        
        // MemoData.swift에 있던 내용과 연동 -> 값 넣어주기
        data.title = self.subject
        data.contents = self.contents.text
        data.image = self.preview.image
        data.tilDate = Date()
        
        // AppDelegate를 읽어온 후, memolist에 MemoData 추가
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.memoList.append(data)
        
        // Save화면 종료
        _ = self.navigationController?.popViewController(animated: true)
    }
    

    
    
    @IBOutlet weak var contents: UITextView!
    @IBOutlet weak var preview : UIImageView!
}
