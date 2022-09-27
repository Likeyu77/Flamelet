//
//  Manager.swift
//  DouBanDemo
//
//  Created by Keyu LI on 23/8/2022.
//

import SwiftUI
//this managerView is implemented in to ManagerRatingList, ManagerRating, WriteRating views
struct ManagerView: View {
    var manager:Manager
    
    var body: some View {
        
        HStack(alignment: .center){
            VStack(alignment:.center){
                Image(manager.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .frame(width: 100, height: 100)
                Text(manager.position)
                    .font(.subheadline)
                    .offset(y: -10)
            }
            .frame(width: 150)

            VStack(alignment: .leading){
                Text("Name: " + manager.name)
                    .font(.subheadline)
                Text("Age: \(manager.age)")
                    .font(.subheadline)
                Text("Gender: \(manager.gender)")
                    .font(.subheadline)
                HStack{
                    Text("Rater: ")
                        .font(.subheadline)
                    
                    ForEach(1 ... 5, id: \.self){ index in
                            Image(systemName: "star.fill")
                                .resizable()
                                .frame(width: 10, height:10)
                                .foregroundColor(index > manager.avgRate() ? Color.gray : Color.yellow)
                    }

                }
                .padding(.top, -10.0)
                
            }
            .offset(x:8)
            
        }

    }

}
var manager:Manager = Manager(name: "Flora Snow", age: 37, gender: "Female", rating: [4], position: "Porduct Manager", Image: "person", comments: comments)

struct Manager_Previews: PreviewProvider {
    static var previews: some View {
        ManagerView(manager: manager)
        
    }
}



