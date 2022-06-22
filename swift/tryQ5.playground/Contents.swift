import UIKit

func turnString(s:String) -> String{
    let temp1 = String(s.reversed()).split(separator:" ")
    let Output = Array(temp1.reversed()).joined(separator:" ")
        return(Output)
}

print(turnString(s:"Let's take LeetCode contest"))
