//
//  Task.swift
//  DouBanDemo
//
//  Created by Keyu LI on 26/9/2022.
//

import SwiftUI

struct Task:Identifiable{
    var id = UUID().uuidString
    var title:String
    var time:Date = Date()
}

struct TasksOnDate: Identifiable{
    var id = UUID().uuidString
    var tasks:[Task]
    var tasksDate: Date
}

func getSampleDate(offset:Int)->Date{
    let calender = Calendar.current
    let date = calender.date(byAdding: .day, value: offset, to: Date())
    return date ?? Date()
}

var tasks:[TasksOnDate] = [
    TasksOnDate(tasks: [
        Task(title: "Aaaaaaaaaaaaaaa"),
        Task(title: "hahahahah"),
        Task(title: "1212onf"),
    ], tasksDate: getSampleDate(offset: 1)),
    
    TasksOnDate(tasks: [
        Task(title: "mac air!!!!!!!!!!"),
    ], tasksDate: getSampleDate(offset: -3)),
    
    TasksOnDate(tasks: [
        Task(title: "love you hehehe"),
    ], tasksDate: getSampleDate(offset: -8)),
    
    TasksOnDate(tasks: [
        Task(title: "hello world hehehe"),
    ], tasksDate: getSampleDate(offset: 10)),
    
    TasksOnDate(tasks: [
        Task(title: "@#$!#$%%$^&#$%&#%^"),
    ], tasksDate: getSampleDate(offset: 20)),
    
    TasksOnDate(tasks: [
        Task(title: "hahahahaahhaha12412305934t"),
    ], tasksDate: getSampleDate(offset: -22)),
]
