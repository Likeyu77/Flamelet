//
//  starRating.swift
//  DouBanDemo
//
//  Created by Keyu LI on 24/8/2022.
//

import SwiftUI

struct starRating: View {
    @Binding var rating: Int
    var lable = ""
    var maximumRating = 5
    
    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View {
        HStack{
            if lable.isEmpty == false {
               Text(lable)
            }
            
            ForEach(1 ..< maximumRating + 1, id: \.self){ number in
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 20, height:20)
                        .padding(.trailing, 5.0)
                        .foregroundColor(number > rating ? offColor : onColor)
                        .onTapGesture {
                        rating = number
                        }
            }
        }

    }
    
}

struct starRating_Previews: PreviewProvider {
    static var previews: some View {
        starRating(rating: .constant(4))
    }
}
