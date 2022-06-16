func rowCheck(input:[String]) -> [String]{
let row1:[Character] = ["q","w","e","r","t","y","u","i","o","p"]
let row2:[Character] = ["a","s","d","f","g","h","j","k","l"]
let row3:[Character] = ["z","x","c","v","b","n","m"]
var array = [String]()

for word in input{
    var row1con = false
    var row2con = false
    var row3con = false
        for character in word{
            if row1.contains(character){
                row1con = true
            }else if row2.contains(character){
                row2con = true
            }else if row3.contains(character){
                row3con = true
            }
        }
        if row1con == true && row2con == false && row3con == false{
            array.append(word)
        }
        if row2con == true && row1con == false && row3con == false{
            array.append(word)
        }
        if row3con == true && row1con == false && row2con == false{
            array.append(word)
        }
    }
    return(array)
}
print(rowCheck(input:["Alaska","Peace","Dad"]))
