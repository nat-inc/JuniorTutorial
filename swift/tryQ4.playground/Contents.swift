func wordsOfEachRow(words:[String]) -> [String]{
var Output = [String]()
let row1 = "qwertyuiop"
let row2 = "asdfghjkl"
let row3 = "zxcvbnm"

for word in words{
    var row1contains = 0
    var row2contains = 0
    var row3contains = 0
    
    for char in word{
        if row1.contains(char){
            row1contains = 1
        }else if row2.contains(char){
            row2contains = 1
        }else if row3.contains(char){
            row3contains = 1
        }
    }
    if row1contains + row2contains + row3contains == 1{
        Output.append(word)
    }
}
    return(Output)
}

print(wordsOfEachRow(words:["Hello","Alaska","Dad","Peace"]))
