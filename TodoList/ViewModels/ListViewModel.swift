//
//  ListViewModel.swift
//  TodoList
//
//  Created by Rakesh Kanneeswaran on 25/06/23.
//

import Foundation
class ListViewModel : ObservableObject {
    @Published var items : [itemModel] = [] {
        didSet{
            saveItem()
        }
    }
    let itemskey  : String = "items_key"
    init (){
        getItems()
    }
    
    func getItems(){
        guard
            let data = UserDefaults.standard.data(forKey: itemskey)
        else {
            return
        }
        guard let saveditems = try? JSONDecoder().decode([itemModel].self, from: data)
        else {
            return
        }
        
        self.items = saveditems
        
    }
    func deleteitems(indexset : IndexSet){
        items.remove(atOffsets: indexset)
    }
    
    func moveItem(from : IndexSet , to : Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    func addItem(title: String){
        let  newItem = itemModel(title: title, isCompleted: false)
        items.append(newItem)
        
    }
    func updateItem(item : itemModel){
        if let index = items.firstIndex(where: {$0.id == item.id }){
            items[index] = item.updateCompleted()
            
        }
    }
    
    func saveItem(){
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedData, forKey: itemskey)
            
        }
    }
    
    
    
}
