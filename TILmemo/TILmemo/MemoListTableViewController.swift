//
//  MemoListTableViewController.swift
//  TILmemo
//
//  Created by 겸 on 2022/08/23.
//

import UIKit

class MemoListTableViewController: UITableViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()

    }

// Cell 갯수를 리턴하는 함수
    override func numberOfSections(in tableView: UITableView) -> Int {
        // appDelegate 안에있는 memoList가 몇개인지 새라
        let count = self.appDelegate.memoList.count
        return count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

}
