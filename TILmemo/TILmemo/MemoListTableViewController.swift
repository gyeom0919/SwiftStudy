//
//  MemoListTableViewController.swift
//  TILmemo
//
//  Created by 겸 on 2022/08/23.
//

import UIKit

class MemoListTableViewController: UITableViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewWillAppear(_ animated: Bool) {
        // 테이블 데이터를 읽어들인다.
        self.tableView.reloadData()

    }
    
    
    


// Cell 갯수를 리턴하는 함수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // appDelegate 안에있는 memoList가 몇개인지 새라
        let count = self.appDelegate.memoList.count
        return count
    }
    
    
    //Delegate
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 배열 데이터에 주어진 행에 맞는 데이터 꺼내기
        let row = self.appDelegate.memoList[indexPath.row]
        
        // 이미지 여부 결정하는 것
        let cellId = row.image == nil ? "memoCell" : "memoCellWithImage"
        
        // 재사용 큐로부터 프로토타임 셀의 인스턴스를 전달받는다
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! memoCell
        
        
        // memoCell 내용
        cell.subject?.text = row.title
        cell.contents?.text = row.contents
        cell.img?.image = row.image
        
        // Date 타입의 날짜를 포맷에 맞춘다
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        cell.tilDate?.text = formatter.string(from: row.tilDate!)
        
        return cell
    }
    

    

}
