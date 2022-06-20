func turnString(s:String) -> String{
    return String(s.reversed()).split(separator: " ").reversed().joined(separator: " ")
}

print(turnString(s:"Let's take LeetCode contest"))

