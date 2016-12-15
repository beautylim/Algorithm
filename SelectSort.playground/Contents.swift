//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var testArray = [61,12,78,24,33,69,30,47,56]

func select_sort(array:[Int])->[Int]{
    var myArray = array
    let n = myArray.count
    for i in 0..<n-1{
        for j in i..<n-1 {
            if myArray[j] < myArray[i] {
                (myArray[j],myArray[i]) = (myArray[i],myArray[j])
            }
        }
    }
    return myArray
}

var date1 = NSDate.init()
select_sort(array: testArray)
print("选择排序：",-date1.timeIntervalSinceNow)
