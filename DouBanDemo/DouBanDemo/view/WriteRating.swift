//
//  WriteRating.swift
//  DouBanDemo
//
//  Created by Keyu LI on 23/8/2022.
//

import SwiftUI

struct WriteRating: View {
    var manager:Manager
    @State var rating:Int
    @State var userInput:String
    @State var isPresented = false
    @State var showManagerRating = false
    var body: some View {
        ZStack (alignment: .center){
            VStack{
                Text("Anonymous Employer Rater")
                
                HStack{
                    ManagerView(manager: self.manager)
                }
                .offset(x:-20)
                
                HStack{
                    starRating(rating: $rating)
                        .offset(x:-20)
                    //这个地方是不是应该用text Filed 去获得输入的数据才行
                    Text("\(rating) Star")
                        .offset(x:15)
                }
                VStack(alignment: .leading){
                    Text("Comment:")
                        .font(.headline)
                    Group{
                        TextEditor(text: $userInput)
                            .frame(width: 350, height: 250)
                            .cornerRadius(25)
        
                    }
                    .frame(width: 355, height: 255)
                    .background(.gray)
                    .cornerRadius(25)
                    

                }
                .padding(10)
                .offset(y:10)
                
                Spacer()
                
                Button("Submit"){
                    
                    isPresented.toggle()
                }
                .foregroundColor(.white)
                .font(.system(size: 20).bold())
                .padding(.horizontal, 20)
                .padding(.vertical,10)
                .background(.yellow)
                .cornerRadius(25)
                Spacer()
            }
            
            
            if (isPresented) {
                VStack(alignment: .center){
                    Color.yellow.opacity(0)
                    VStack{
                        Text("Do you want to submit it?")
                            .foregroundColor(.white)
                        
                        HStack(spacing:30){
                            Button("Yes", action: {
                               
                                manager.addRater(star: rating)

                                isPresented.toggle()
                                showManagerRating.toggle()
                            })
                            .foregroundColor(.black)
                            .font(.system(size: 15).bold())
                            .frame(width: 60, height: 30)
                            .background(.white)
                            .cornerRadius(25)
                            
                            
                            
                            
                            Button("No"){
                                isPresented.toggle()
                            }
                            .foregroundColor(.black)
                            .font(.system(size: 15).bold())
                            .frame(width: 60, height:30)
                            .background(.white)
                            .cornerRadius(25)
                        }
                        
                    }
                    
                    .padding(.horizontal, 30)
                    .padding(.vertical,30)
                    .background(.orange)
                    .cornerRadius(20)
//                    .zIndex(100)
                    .offset(y:-400)
                }
            }
            if(showManagerRating){
                Color.white.edgesIgnoringSafeArea(.all)
                ManagerRating(manager: manager)
            }
            
        }

        
    }
}
var comments2 = ["edfgaergerg","asdfasdfawdf","qergfaergfaeg"]
var manager1 = Manager(name: "Flora Snow", age: 37, gender: "Female", rating: [4], position: "Porduct Manager", Image: "person", comments: comments2)
struct WriteRating_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WriteRating(manager: manager1, rating:Int(0),userInput:"")
                .previewInterfaceOrientation(.portrait)

        }
    }
}

