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
    
    // segue 수행하는 것에 대해 준비하는 메소드
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // performSegue 전에 데이터 넘기기 -> DetailViewController
        if segue.identifier == "showDetail" {
            // segue의 도착지를 DetailViewController로
            let vc = segue.destination as? DetailViewController
            if let index = sender as? Int {
                vc?.name = nameList[index]
                vc?.job = jobList[index]
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myTableView.delegate = self
        myTableView.dataSource = self
        
    }
    
    //Datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else{
            return UITableViewCell()
        }
        let img = UIImage(named: "\(nameList[indexPath.row]).jpg")
        cell.profilePhoto.image = img
        cell.nameLabel.text = nameList[indexPath.row]
        cell.jobLabel.text = jobList[indexPath.row]
        
        return cell
    }
    
    //  Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row + 1)번째 셀 입니다.")
        
        //segue 수행
        // showDetail Segue를 수행하게 되면 indexPath.row를 DetailViewController로 전송한다
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
    }


}

class ListCell: UITableViewCell {
    @IBOutlet weak var nameLabel:UILabel!
    @IBOutlet weak var jobLabel:UILabel!
    @IBOutlet weak var profilePhoto:UIImageView!
}
