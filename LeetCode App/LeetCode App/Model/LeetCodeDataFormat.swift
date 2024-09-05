//
//  LeetCodeDataFormat.swift
//  LeetCode App
//
//  Created by Shaik Ismail on 01/09/24.
//

import Foundation
struct LeetCodeDataFormat:Decodable
{
    let totalSolved:Int
    let easySolved:Int
    let mediumSolved:Int
    let hardSolved:Int
    let ranking:Int
}
