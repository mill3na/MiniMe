//
//  InitialView.swift
//  MiniMeWatch Watch App
//
//  Created by Ana Raiany Guimarães Gomes on 2023-06-21.
//

import Foundation
import SwiftUI
import CloudKit

struct InitialView: View {
    
    @StateObject private var viewModel = TaskViewModel(container: CKContainer(identifier: "iCloud.miniMe"))
    
    @State var taskInProgress: Task?
    
    var body: some View {
        Group {
            if let taskInProgress {
//                ActivityTimerWatch(totalDeSegundosDaTask: Int, segundosQuePassaram: Int)
                ActivityTimerWatch(countTo: secondsToComplete(for: taskInProgress))
            } else {
                VStack {
                    Image("MiniMe")
                        .resizable()
                        .imageScale(.large)
                        .frame(width: 80.0, height: 80.0)
                    Text("Nenhuma atividade em andamento")
                        .padding()
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(10)
                }
            }
        }
        .onAppear {
            viewModel.populateTasks {
                
                let allTasks = viewModel.items
                
                print("todas as tasks: ", allTasks.count)
                
                let taskInProgress = allTasks.first(where: { $0.task.startTime != nil })
                
                print("nome:", taskInProgress?.task.title)
                print("start:", taskInProgress?.task.startTime?.formatted())
                print("duracao:", taskInProgress?.task.minutesTime)

                
                // start time = 10:50
                // duracao = 10 minutos
                // agora = 10:55
                
                self.taskInProgress = taskInProgress?.task
                                
            }
        }
    }
    
    func progress(for task: Task) -> Double {
        
        let elapsedSeconds = Date.now.timeIntervalSinceReferenceDate - task.startTime!.timeIntervalSinceReferenceDate
        let totalSeconds = Double(task.minutesTime)
        
        return 1 - (totalSeconds - elapsedSeconds)/totalSeconds
        
    }
    
    func secondsToComplete(for task: Task) -> Int {
        
        let elapsedSeconds = Date.now.timeIntervalSinceReferenceDate - task.startTime!.timeIntervalSinceReferenceDate
        let totalSeconds = Double(task.minutesTime)
        
        return Int(totalSeconds - elapsedSeconds)
    }
    
}

