//
//  ListView.swift
//  TodoList
//
//  Created by Rakesh Kanneeswaran on 24/06/23.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel : ListViewModel
    
    
    var body: some View {
        ZStack{
            if listViewModel.items.isEmpty{
                noItemsView()
            }
            else{
                List {
                    ForEach(listViewModel.items){item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear){
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteitems)
                    .onMove(perform: listViewModel.moveItem)
                }
                .listStyle(PlainListStyle())
            }
        }
        
        
        .navigationTitle("ToDo List 🖊️")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink ("add", destination : AddView())
            
        )
        
        
    }
}


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ListView()
        }.environmentObject(ListViewModel())
        
    }
}



