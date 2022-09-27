//
//  CalendarAddTaskView.swift
//  DouBanDemo
//
//  Created by Keyu LI on 26/9/2022.
//

import SwiftUI

struct CalendarAddTaskView: View {
    @State var currentDate:Date = Date()
    var body: some View {
        ScrollView(.vertical,showsIndicators: false){
            VStack(spacing:20){
                //calendar view
                CalendarView(currentDate: $currentDate)
            }
        }
    }
}

struct CalendarAddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarAddTaskView()
    }
}
