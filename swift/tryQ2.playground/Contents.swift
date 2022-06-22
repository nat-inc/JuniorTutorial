func getConsecutiveOnes(s:String) -> Int{
var indexOfUniqOne:[Character:Int] = [:]
for char in s{
    if indexOfUniqOne[char] == nil{
        indexOfUniqOne[char] = 1
    }else{
        indexOfUniqOne[char] = indexOfUniqOne[char]! + 1
    }
}

for (index,char) in s.enumerated(){
    if indexOfUniqOne[char] == 1{
        return(index)
    }
}
    return -1
}

print(getConsecutiveOnes(s:"scanatscan"))
