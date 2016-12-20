//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var testArray = [61,12,78,24,33,69,30,47,56]
func bubbleSort(array:[Int])->[Int]{
    var myArray = array
    let n = myArray.count
    for _ in 0..<n-1 {
        let j:Int = 0
        for j in 0..<n-j-1 {
            if myArray[j] > myArray[j+1] {
                (myArray[j],myArray[j+1]) = (myArray[j+1],myArray[j])
            }
        }
    }
    return myArray;
}

var date1 = NSDate.init();
bubbleSort(array: testArray)
print("冒泡排序：",-date1.timeIntervalSinceNow)
