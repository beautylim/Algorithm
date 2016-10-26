//
//  ALBubble.swift
//  Algorithm
//
//  Created by li.min on 2016/10/26.
//  Copyright © 2016年 li.min. All rights reserved.
//

import Foundation

extension Array where Element:Comparable{
    func Bubble()->[Element]{
        var newArray = self
        let n = newArray.count
        for i in 0...n-2 {
            for j in 0...n-i-2 {
                if newArray[j] > newArray[j+1] {
                    (newArray[j],newArray[j+1]) = (newArray[j+1],newArray[j])
                }
            }
        }
        return newArray
    }
}
