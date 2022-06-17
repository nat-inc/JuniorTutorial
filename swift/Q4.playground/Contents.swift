func rowCheck(input:[String]) -> [String]{
let row1:[Character] = ["q","w","e","r","t","y","u","i","o","p"]
let row2:[Character] = ["a","s","d","f","g","h","j","k","l"]
let row3:[Character] = ["z","x","c","v","b","n","m"]
var array = [String]()

for word in input{
    var row1con = 0
    var row2con = 0
    var row3con = 0
        for character in word{
            if row1.contains(character){
                row1con = 1
            }else if row2.contains(character){
                row2con = 1
            }else if row3.contains(character){
                row3con = 1
            }
        }
        if row1con + row2con + row3con == 1{
            array.append(word)
        }
    }
    return(array)
}
print(rowCheck(input:["Alaska","Peace","Dad"]))
