//
//  TodoViewModel.swift
//  StudyAlamofire
//
//  Created by 겸 on 2022/11/14.
//

import Foundation
import Alamofire

class TodoViewModel : ObservableObject {
    
    @Published var todo = [Todo]()
    
    init(){
        
    }
    
    func fetchTodos() {
        let url = "https://jsonplaceholder.typicode.com/todos"
        AF.request(url, method: .get)
            .responseDecodable(of: [Todo].self) { data in
                guard let data = data.value else { return }
                print(data)
                self.todo = data
            }
    }
    
}
