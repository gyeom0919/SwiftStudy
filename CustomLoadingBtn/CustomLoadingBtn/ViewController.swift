//
//  ViewController.swift
//  CustomLoadingBtn
//
//  Created by 겸 on 2022/09/29.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .systemBlue
    }



}


#if DEBUG

import SwiftUI

struct ViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewController().getPreview()
//            .ignoresSafeArea()
    }
}

#endif

