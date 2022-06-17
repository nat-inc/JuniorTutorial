
func rowCheck(input:[String]) -> [String]{

let row1:[Character] = ["q","w","e","r","t","y","u","i","o","p"]
let row2:[Character] = ["a","s","d","f","g","h","j","k","l"]
let row3:[Character] = ["z","x","c","v","b","n","m"]
var array = [String]()

     for (word) in input{
        let result1 = word.filter{(char) in
            return !row1.contains(char)
        }

         if (result1.count == 0) {
             array.append(word)
             continue
         }
        let result2 = word.filter{(char) in
            return !row2.contains(char)
        }
         if  (result2.count == 0) {
             array.append(word)
             continue
         }
             
        let result3 = word.filter{(char) in
            return !row3.contains(char)
        }
    
         if (result3.count == 0) {
             array.append(word)
             continue
         }
     }
    return array
}

print(rowCheck(input:["asa", "wse", "dad"]))


//
//let filteredResult = input.filter{(character) in
//
//    return !row1.contains(character)
//}
//
//func rowCheck(input:String) {
//let row1:[Character] = ["q","w","e","r","t","y","u","i","o","p"]
//let row2:[Character] = ["a","s","d","f","g","h","j","k","l"]
//let row3:[Character] = ["z","x","c","v","b","n","m"]
//
//}
