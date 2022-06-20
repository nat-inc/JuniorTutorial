func turnString(s:String) -> String{
var Input = s
var Temp = ""
var Output = ""
    
while (Input.count != 0) {
    let wordIndex = Input.firstIndex(of: " ") ?? Input.endIndex
    let word = Input[..<wordIndex]
        for index in word.indices{
            Temp.insert(word[index], at: Temp.startIndex)
        }
            if (Output.count != 0){
                Output.append(" ")
            }
        Output.append(Temp)
        Temp = ""
        let range = Input.startIndex..<wordIndex
        Input.removeSubrange(range)
            if (Input.count != 0){
                Input.remove(at: Input.startIndex)
            }
        }
   return(Output)
}

print(turnString(s:"Let's take LeetCode contest"))


 /*練習
    let index4 = input.firstIndex(of: " ") ?? input.endIndex
    let beginning2 = input[..<index4]

    let ending = input3.suffix(from:index3)


    print(ending)

    var output3 = ""
    for index in beginning.indices{
        output3.insert(beginning[index], at: output.startIndex)
}

var output4 = ""

for index in beginning2.indices{
    output4.insert(beginning2[index], at: output.startIndex)
}
print(output3)
print(output4)
output3.append(output4)

print(output3)
//}


練習
input[input.startIndex]

let char0 = input[input.index(input.startIndex, offsetBy:0)]
let char1 = input[input.index(input.startIndex, offsetBy:1)]
let char2 = input[input.index(input.startIndex, offsetBy:2)]
let char3 = input[input.index(input.startIndex, offsetBy:3)]
let char4 = input[input.index(input.startIndex, offsetBy:4)]
let char5 = input[input.index(input.startIndex, offsetBy:5)]

var output = ""
output.insert(char0, at: output.startIndex)
output.insert(char1, at: output.startIndex)
output.insert(char2, at: output.startIndex)
output.insert(char3, at: output.startIndex)
output.insert(char4, at: output.startIndex)
output.insert(char5, at: output.startIndex)
*/
