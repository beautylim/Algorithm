//
//  ALConvert.swift
//  Algorithm
//
//  Created by li.min on 2016/10/26.
//  Copyright © 2016年 li.min. All rights reserved.
//

import Foundation

extension Array {
    func revert()->[Element]{
        var newArray = self
        let n = newArray.count
        let middle = n/2 - 1
        for i in 0...middle{
            (newArray[i],newArray[n-1-i]) = (newArray[n-1-i],newArray[i])
        }
        return newArray
    }
}

