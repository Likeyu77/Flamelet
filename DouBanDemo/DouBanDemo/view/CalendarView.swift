//
//  CalendarView.swift
//  DouBanDemo
//
//  Created by Keyu LI on 26/9/2022.
//

import SwiftUI

struct CalendarView: View {
    @Binding var currentDate: Date
    
    @State var currentMonth: Int = 0
    var body: some View {
        VStack(spacing:35){
            
            // week days
            let days:[String] = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
            
            HStack(spacing:20){
                VStack(alignment: .leading, spacing: 10){
                    Text(extraDate()[0])
                        .font(.caption)
                        .fontWeight(.semibold)
                    Text(extraDate()[1])
                        .font(.title.bold())
                }
                Spacer(minLength: 0)
                    
                Button{
                    withAnimation{
                        currentMonth -= 1
                    }
                }label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                }
                
                Button{
                    withAnimation{
                        currentMonth += 1
                    }
                }label: {
                    Image(systemName: "chevron.right")
                        .font(.title2)
                }
            }

            .padding(.horizontal)
            
            
            HStack(spacing:0){
                ForEach(days, id:\.self){day in
                    Text("\(day)")
                        .font(.callout)
                        .fontWeight(.semibold)
                        .frame(maxWidth:.infinity)
                }
            }
            
            let columns = Array(repeating: GridItem(.flexible()), count: 7)
            
            LazyVGrid(columns: columns, spacing: 15){
                ForEach(extractDate()){value in
                    
                    cardView(value: value)
                        .background(
                            
                            Capsule()
                                .fill(Color("Pink"))
                                .padding(.horizontal, 8)
                                .opacity(isSameDay(date1: value.date, date2: currentDate) ? 1 : 0)
                        )
                        .onTapGesture {
                            currentDate = value.date
                        }

                    
                }
            }
        }
        .onChange(of:currentMonth){newValue in
            //update month
            currentDate = getCurrentMonth()
        }
    }
    
    @ViewBuilder
    func cardView(value: CalendarDate)->some View{
        VStack{
            if value.day != -1{
                
                //if tasks date is same with current printing date in the calender, add pink point under the date
                if let task = tasks.first(where: { task in
                    return isSameDay(date1: task.tasksDate, date2: value.date)
                }){
                    Text("\(value.day)")
                        .font(.title3.bold())
                        .foregroundColor(isSameDay(date1: task.tasksDate, date2: currentDate) ? .white : .primary)
                    Spacer()
                    
                    Circle()
                        .fill(isSameDay(date1: task.tasksDate, date2: currentDate) ? Color("white") : Color("Pink"))
                        .frame(width: 8, height: 8)
                }else{
                    Text("\(value.day)")
                        .font(.title3.bold())
                        .foregroundColor(isSameDay(date1:value.date, date2: currentDate) ? .red : .primary)
                    Spacer()
                }
            }
        }
        .padding(.vertical, 9)
        .frame(height: 60, alignment: .top)
    }
    
    //checking dates
    func isSameDay(date1: Date, date2:Date)-> Bool{
        let calendar = Calendar.current
        return calendar.isDate(date1, inSameDayAs: date2)
    }
    
    
    
    //get current year and month for display
    func extraDate()->[String]{
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY MMMM"
        
        let date = formatter.string(from: currentDate)
        
        return date.components(separatedBy: " ")
    }
    
    
    func getCurrentMonth() ->Date{
        let calendar = Calendar.current
        
        guard let currentMonth = calendar.date(byAdding: .month, value:self.currentMonth, to: Date()) else{
            return Date()
        }
        return currentMonth
    }
    
    
    func extractDate()->[CalendarDate]{
        let calendar = Calendar.current
        
        let currentMonth = getCurrentMonth()
        
        var days = currentMonth.getAllDates().compactMap{ date -> CalendarDate in
            let day = calendar.component(.day, from: date)
            
            return CalendarDate(day: day, date: date)
        }
        
        // adding offset days to get exact week day
        let firstWeekday = calendar.component(.weekday, from: days.first?.date ?? Date())
        
        for _ in 0..<firstWeekday - 1{
            days.insert(CalendarDate(day: -1, date: Date()), at:0)
        }
        return days
    }
}
struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//        CalendarView(currentDate: Date())
    }
}

extension Date{
    func getAllDates() ->[Date]{
        let calendar = Calendar.current
        
        let startDate = calendar.date(from: Calendar.current.dateComponents([.year,.month],from: self))!
        
        let range = calendar.range(of: .day, in: .month, for: startDate)!
        
//        range.removeLast()
        
        return range.compactMap { day -> Date in
            return calendar.date(byAdding: .day, value: day - 1, to: startDate)!
        }
    }
}
