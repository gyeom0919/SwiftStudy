//
//  ViewController.swift
//  ScrollView
//
//  Created by 겸 on 2022/10/19.
//

import UIKit
import Lottie

class ViewController: UIViewController {

    @IBOutlet var loadingView: LottieAnimationView!
    
    @IBOutlet var myScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        loadingView.animation = LottieAnimation.named("loading_animation")
        loadingView.loopMode = .loop
//        loadingView.backgroundColor = .clear
        loadingView.play()
        configureRefreshControl()
        
    }

}

//MARK: - 리프레시 관련
extension ViewController {
    
    func configureRefreshControl () {
        
       // Add the refresh control to your UIScrollView object.
        
        let myRefreshControl = UIRefreshControl()
        
        myRefreshControl.addTarget(self, action:
                                    #selector(handleRefreshControl),
                                    for: .valueChanged)
        
       myScrollView.refreshControl = myRefreshControl
    }
        
    @objc func handleRefreshControl() {
        
        print(#fileID, #function, #line, "- <#comment#>")

        
       // Update your content…

       // Dismiss the refresh control.
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            self.myScrollView.refreshControl?.endRefreshing()
        })
//       DispatchQueue.main.async {
//          self.myScrollView.refreshControl?.endRefreshing()
//       }
    }
    
}

