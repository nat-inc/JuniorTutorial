import UIKit

func patternOfAnimals(pattern: String, s:String) -> Bool{
    var arr = [String]()
    for char in pattern{
        if char == "a"{
            arr.append("dog")
        }else if char == "b"{
            arr.append("cat")
        }else if char == "c"{
            arr.append("fish")
        }else if char == "d"{
            arr.append("bird")
        }
    }
    let result = arr.joined(separator:" ")
    if result == s{
    return true
    }else{
        return false
    }
}
print(patternOfAnimals(pattern:"abba", s:"dog cat cat dog"))
