//
//  AddView.swift
//  TodoList
//
//  Created by Rakesh Kanneeswaran on 24/06/23.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var textFeildText : String = ""
    @EnvironmentObject var listViewModel : ListViewModel
    @State var alertTile : String = ""
    @State var showalert : Bool = false
    var body: some View {
        ScrollView{
            VStack{
                
                TextField("Type something here.....",text:$textFeildText )
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.gray)
                    .cornerRadius(10)
                Button (action : saveButtonPressed , label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })

            }.padding(14)
            
        }.navigationTitle("Add item 🖊️")
            .alert(isPresented: $showalert , content: getAlter)
    }
    func saveButtonPressed(){
        if textIsAppropriate() {
            listViewModel.addItem(title: textFeildText)
            presentationMode.wrappedValue.dismiss()
        }
        
    }
    func textIsAppropriate() -> Bool{
        if textFeildText.count < 3 {
            alertTile = "Your new todo item must be three charater long "
            showalert.toggle()
            return false
        }
        return true
    }
    
    func getAlter() -> Alert{
        return Alert(title: Text(alertTile))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            
            AddView()
            
        }.environmentObject(ListViewModel())
    }
}
