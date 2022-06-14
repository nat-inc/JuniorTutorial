import UIKit

var greeting = "Hello, playground"

func FizzBuzz(n:Int) ->Array<String>{
    var array1 = [String]()
    if n <= 0 {
        return array1
    }
      for i in 1...n{
        if(i%3 == 0 && i%5 == 0){
            array1 += ["FizzBuzz"]
        }else if(i%3 == 0){
            array1 += ["Fizz"]
        }else if(i%5 == 0){
            array1 += ["Buzz"]
        }else{
            let iStr:String = String(i)
            array1 += [iStr]
        }
      }
    return array1
    }
print(FizzBuzz(n:-1))

