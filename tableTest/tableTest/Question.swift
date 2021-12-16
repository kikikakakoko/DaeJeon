//
//  Question.swift
//  tableTest
//
//  Created by max on 2021/12/16.
//

import Foundation

struct Question:Codable {
    
    var answer:[String]?
    var explain:[String]?
    var secondExplain:[String]?
    var thirdExplain:[String]?
    var detail:String?
}
