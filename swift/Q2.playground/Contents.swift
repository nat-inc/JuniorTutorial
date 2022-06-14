func test(str: String) -> Int {
    var integerOfAlphabet:[Character: Int] = [:]
    for (character) in str{
        if integerOfAlphabet[character] == nil{
            integerOfAlphabet[character] = 1
        }else{
            integerOfAlphabet[character] = integerOfAlphabet[character]! + 1
        }
    }
    
        for (index, character) in str.enumerated(){
            if (integerOfAlphabet[character] == 1){
                return index
            }
    }
    return -1
}

print(test(str:"scanatscan"))


