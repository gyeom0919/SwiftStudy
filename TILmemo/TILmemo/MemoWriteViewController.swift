//
//  MemoWriteViewController.swift
//  TILmemo
//
//  Created by 겸 on 2022/08/23.
//

import UIKit

class MemoWriteViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func pickPhoto(_ sender: Any) {
        let imagePick = UIImagePickerController()
        
        imagePick.delegate = self
        imagePick.allowsEditing = true
        
        self.present(imagePick, animated: true)
    }
    
    @IBAction func saveMemo(_ sender: Any) {
    }
    
    
    @IBOutlet weak var contents: UITextView!
    @IBOutlet weak var preview : UIImageView!
}
