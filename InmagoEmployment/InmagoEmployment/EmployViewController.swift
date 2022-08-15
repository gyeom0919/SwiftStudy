//
//  EmployViewController.swift
//  InmagoEmployment
//
//  Created by 겸 on 2022/08/13.
//

import UIKit

class EmployViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let nameList = ["정현일", "이겸", "전현민", "김태민"]
    
    let jobList = ["게임개발", "앱개발", "웹개발", "웹개발"]
    
    @IBOutlet var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myTableView.delegate = self
        myTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    //Datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else{
            return UITableViewCell()
        }
        
        cell.nameLabel.text = nameList[indexPath.row]
        cell.jobLabel.text = jobList[indexPath.row]
        
        return cell
    }
    
    //  Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row) 번째 셀 입니다.")
    }


}

class ListCell: UITableViewCell {
    @IBOutlet weak var nameLabel:UILabel!
    @IBOutlet weak var jobLabel:UILabel!
}
