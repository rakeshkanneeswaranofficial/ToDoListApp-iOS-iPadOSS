//
//  ListRowView.swift
//  TodoList
//
//  Created by Rakesh Kanneeswaran on 24/06/23.
//

import SwiftUI

struct ListRowView: View {
    var item : itemModel
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ?  "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical , 8)
    }
}
struct ListRowView_Previews: PreviewProvider {
    static var itempreview = itemModel(title: "test title ", isCompleted: false)
    static var previews: some View {
        ListRowView(item: itempreview )
    }
}
