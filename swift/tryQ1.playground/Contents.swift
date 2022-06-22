func FizzBuzz(n:Int) -> [String]{
var Output = [String]()
    if n < 0{
        return Output
    }
for i in 1...n{
    if i%5 == 0 && i%3 == 0{
        Output += ["FizzBuzz"]
    }else if i%3 == 0{
        Output += ["Fizz"]
    }else if i%5 == 0{
        Output += ["Buzz"]
    }else{
        let iStr = String(i)
        Output += [iStr]
    }
}
    return Output
}

print(FizzBuzz(n:15))
