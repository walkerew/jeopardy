//
//  Category.swift
//  JeopardyTrainer
//
//  Created by Emily Walker on 12/8/19.
//  Copyright © 2019 Emily Walker. All rights reserved.
//
// save file

import Foundation


class Category {
    var id: Int!
    var title: String!
    var cluesCount: Int!
    
    init(id: Int, title: String, cluesCount: Int) {
        self.id = id
        self.title = title
        self.cluesCount = cluesCount
    }
    
}
