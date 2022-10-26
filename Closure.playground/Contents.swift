import UIKit

//MARK: - 클로저 기초

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

//MARK: - 매개변수로서 클로저

func sayHi(completion: () -> Void) {
    print("sayHi() Called")
    sleep(3) // n초 멈춤
    
    completion()
}

sayHi(completion: {
    print("3초가 지났다")
})

func sayHiWithName(completion: (String) -> Void) {
    print("sayHiWithName Called")
    sleep(2)
    
    completion("안녕하세요")
}

sayHiWithName(completion: { (comment : String) in
    print("2초 뒤에 그가 말했다! comment : ", comment)
})

sayHiWithName{ comment in
    print("2초 뒤에 그가 말했다! comment : ", comment)
}

sayHiWithName{
    print("2초 뒤에 그가 말했다! comment : ", $0)
}

func sayHiWithName(completion: (String, String) -> Void) {
    print("sayHiWithName Called")
    sleep(2)
    
    completion("안녕하세요", "호로롤롤")
}

sayHiWithName{ first, second in
    print("첫번째 : \(first), 두번째 : \(second)")
}

func sayHiOptional(completion: (() -> Void)? = nil) {
    print("sayHiWithName Called")
    sleep(2)
    
    completion?()
}

sayHiOptional()
sayHiOptional(completion: {
    print("2 second passed")
})
