func countOfRepeat1 (box:[Int]) -> Int{
var countA = 0
    var appendToCount = "A"
var countB = 0
for num in box{
    if num == 1{
        if appendToCount == "A"{
            countA += 1
        }else if appendToCount == "B"{
            countB += 1
        }
    }else {
        if countA >= countB {
             countB = 0
            appendToCount = "B"
        }else if countB > countA {
             countA = 0
            appendToCount = "A"
        }
        }
    }
    if countA > countB {
        return countA
    }else{
    return countB
}
}

print(countOfRepeat1(box:[1,0,1,1,0,1]))
//count1,2を比べて0が来たときに小さい方をリセット、それを繰り返す

//box:[1,1,0,1,1,0,0,1,1,1]の時、前後の1,1と1,1,1が足されてしまう
