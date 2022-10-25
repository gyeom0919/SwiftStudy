import UIKit

let myName : String = {
    
    return "겸"
}()

print(myName)

let myRealName : (String) -> String = { (name : String) -> String in
    
    return "저의 이름은 \(name)"
}

myRealName("겸겸")

let myRealNameLogic : (String) -> Void = { (name : String) in
    print("제 이름은 \(name)")
}

myRealNameLogic("겸겸")
