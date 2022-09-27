//
//  ManagerViewModel.swift
//  DouBanDemo
//
//  Created by Keyu LI on 1/9/2022.
//

import Foundation
@MainActor class ManagerViewModel: ObservableObject {
    @Published var ManagerList:[Manager] = [
        Manager(name: "Flora Snow", age: 37, gender: "Female", rating: [3], position: "Porduct Manager", Image: "person", comments: ["edfgaergerg","asdfasdfawdf","qergfaergfaeg"]),
        Manager(name: "Jerry Thomas", age: 42, gender: "Male", rating: [4], position: "CFO", Image: "person", comments: ["edfgaergerg","asdfasdfawdf","qergfaergfaeg"]),
        Manager(name: "Xiaochuan Sun", age: 37, gender: "Male", rating: [4], position: "Sales Manger", Image: "person", comments: ["edfgaergerg","asdfasdfawdf","qergfaergfaeg"])
    ]
    
    func getList() -> [Manager]{
        return ManagerList
    }
    
    func updateRate(manager:Manager, comment:String, star:Int){
        manager.addComments(comment: comment)
        manager.addRater(star: star)
    }
//    init(ManagerList:[Manager]){
//        self.ManagerList = ManagerList;
//      
//    }
    

    
}
