//
//  itemModel.swift
//  TodoList
//
//  Created by Rakesh Kanneeswaran on 25/06/23.
//

import Foundation

struct itemModel  : Identifiable ,Codable{
    var id: String = UUID().uuidString
    let title : String
    let isCompleted : Bool
    
    init(id: String = UUID().uuidString,title: String,isCompleted: Bool){
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
        
        
    }
    func updateCompleted() -> itemModel{
        return itemModel(id:id,title: title, isCompleted: !isCompleted)
    }
}
