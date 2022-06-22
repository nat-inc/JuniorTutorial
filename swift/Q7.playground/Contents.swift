import UIKit

func indexOfContains(para1:String, para2:String) ->Int{
    var Output:Int? = nil
    if para1.contains(para2){
        let firstChar = para2[para2.startIndex]
        for (index,char) in para1.enumerated(){
            if char == firstChar{
                if Output == nil{
                    Output = index
                }
            }
        }
    }else {
        return -1
    }
            return(Output!)
}

print(indexOfContains(para1:"scanat",para2:"nat"))

