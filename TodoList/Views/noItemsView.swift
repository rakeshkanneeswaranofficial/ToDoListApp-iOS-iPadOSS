//
//  noItemsView.swift
//  TodoList
//
//  Created by Rakesh Kanneeswaran on 25/06/23.
//

import SwiftUI

struct noItemsView: View {
    @State var  animate : Bool = false
    let secondaryAccentcolor = Color("SecondaryAccentColor")
    var body: some View {
        ScrollView{
            VStack(spacing: 10){
                Text("There are not items !")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you a produtive person? I think you should click the add button and a bunch of items to your todo list")
                NavigationLink(
                    destination: AddView(),label: {
                        Text("Add something 🥳")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background( animate ? secondaryAccentcolor :  Color.accentColor)
                            .cornerRadius(10)
                    }).padding(.horizontal,animate ? 30 : 50)
                    .shadow(
                        color: animate ? secondaryAccentcolor.opacity(0.7) : .accentColor.opacity(0.7), radius: 15 ,
                        x : 0 ,
                        y : animate ? 50 : 30
                    )
                    .scaleEffect(animate ? 1.1 : 1.0)
                    .offset(y: animate ? -7 : 0)
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity , maxHeight: .infinity)
    }
    
    func addAnimation(){
        
        guard !animate else {return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 1.0)
                    .repeatForever()
            )
            {
                animate.toggle()
            }
        }
        }
        
    }




struct noItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            noItemsView()
                .navigationTitle("Title")
        }
    }
}
