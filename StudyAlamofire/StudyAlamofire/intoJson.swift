//
//  intoJson.swift
//  StudyAlamofire
//
//  Created by 겸 on 2022/11/14.
//

import Foundation


// Codable protocol을 사용해야 JSON 형식을 디코딩, 인코딩 할 수 있다
struct Todo : Identifiable, Codable {
    var userId: Int
    var id : Int
    var title : String
    var completed : Bool
    
    private enum CondigKeys: String, CodingKey {
        case userId = "userId"
        case id = "id"
        case header = "title"
        case completed = "completed"
        
    }
}
