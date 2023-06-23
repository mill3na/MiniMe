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
                ActivityTimerWatch(startTime: taskInProgress.startTime!, countTo: secondsToComplete(for: taskInProgress))
            } else {
                VStack {
                    Image("Icon-miniME")
                        .resizable()
                        .imageScale(.large)
                        .frame(width: 80.0, height: 80.0)
                    Text("Nenhuma atividade em andamento")
                        .padding()
                        .foregroundColor(.white)
                        .cornerRadius(5)
                }
            }
        }
        .onAppear {
            viewModel.populateTasks {
                
                let allTasks = viewModel.items
                
                print("todas as tasks: ", allTasks.count)

                let taskInProgress = allTasks
                    .filter { $0.startTime != nil }
                    .sorted { vm1, vm2 in vm1.startTime! < vm2.startTime! } // mudar se nao funcionar kk
                    .first
                
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
    
    func secondsToComplete(for task: Task) -> Int {
        
        let elapsedSeconds = Date.now.timeIntervalSinceReferenceDate - task.startTime!.timeIntervalSinceReferenceDate
        let totalSeconds = Double(task.minutesTime)
        
        return Int(totalSeconds - elapsedSeconds)
    }
    
}

