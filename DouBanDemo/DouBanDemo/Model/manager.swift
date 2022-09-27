//
//  managerClass.swift
//  DouBanDemo
//
//  Created by Keyu LI on 31/8/2022.
//

import SwiftUI

class Manager:Identifiable, ObservableObject{
    var id: UUID = UUID()
    var name:String
    var age:Int
    var gender:String
    @Published var rating:[Int]
    var position:String
    var image:String
    @Published var comments:[String]
    
    init(name:String, age:Int, gender:String, rating:[Int], position:String, Image:String, comments:[String]){
        self.name = name
        self.age = age
        self.gender = gender
        self.rating = rating
        self.position = position
        self.image = Image
        self.comments = comments
    }
    
    func addComments(comment:String){
        self.comments.append(comment)
    }
    
    func addRater(star:Int){
        self.rating.append(star)
    }
    
    func avgRate() -> Int{
        var sumRate = 0
        for number in self.rating {
            sumRate += number
        }
        return Int(sumRate / self.rating.count)
    }
}
