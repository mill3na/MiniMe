//
//  ActivityTimerWatch.swift
//  MiniMeWatch Watch App
//
//  Created by Ana Raiany Guimarães Gomes on 2023-06-19.
//

import SwiftUI

let timer = Timer
    .publish(every: 1, on: .main, in: .common)
    .autoconnect()

struct ActivityTimerWatch: View {
    @State var counter: Int = 0
    @State var isPaused: Bool = false
    @State private var showingSheet: Bool = false
    @State private var isPlaying: Bool = false
    
    var countTo: Int // change this parameter when calling the view. This is the time in minutes.
    
    init(startTime: Date, countTo totalSeconds: Int) {
        self.countTo = totalSeconds
        
        // calcula tempo que ja passou
        let doubleTotalSeconds = Double(totalSeconds)
        let elapsedSeconds = Date.now.timeIntervalSinceReferenceDate - startTime.timeIntervalSinceReferenceDate
        let progress = 1 - (doubleTotalSeconds - elapsedSeconds)/doubleTotalSeconds // porcentagem do tempo que ja passou
        self.counter =  Int(progress * doubleTotalSeconds)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            
            ZStack (alignment: .center) {
                Circle()
                    .fill(Color.clear)
                    
                    .overlay(
                        Circle().stroke(Color.blue, lineWidth: 15))
                
                Circle()
                    .fill(Color.clear)
                    .overlay(
                        Circle().trim(from: 0, to: progress())
                            .stroke(style:
                                        StrokeStyle(
                                            lineWidth: 10,
                                            lineCap: .round,
                                            lineJoin: .round)
                                   )
                            .foregroundColor(
                                (completed() ? Color.blue : Color.white))
                            .animation (
                                .easeInOut(duration: 0.2))
                    )
                
                VStack (spacing: 0) {
                    Image("Icon-miniME")
                        .resizable()
                        .frame(width: 65, height: 65)
                    Clock(counter: counter, countTo: countTo)
                    
                }
            }
            .padding()
            
            Spacer()
                        
            HStack (alignment: .center, spacing: 2) {
                pauseButtonComponent(text: "Pausar", activity: pause)
                ButtonComponent(text: "Finalizar", activity: endTimer)
                    .sheet(isPresented: $showingSheet) {
                        FeelingSheet()
                    }
            }
        }
        .padding(.bottom, 10)
        .edgesIgnoringSafeArea(.bottom)
        .onReceive(timer) { time in
            if isPaused == false {
                initTimer()
            }
        }
            
    }
    
    func pause() {
        print(self.isPaused)
        if self.isPaused == false {
            self.isPaused = true
        } else {
            self.isPaused = false
            initTimer()
        }
        print(self.isPaused)
    }
    
    func initTimer() {
        if self.counter < self.countTo {
            self.counter += 1
        }
        
    }
    
    func endTimer() {
        self.counter = self.countTo
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.showingSheet.toggle()
        }
    }
    
    func completed() -> Bool {
        return progress() == 1
    }
    
    func progress() -> CGFloat {
        return CGFloat(counter) / CGFloat(countTo)
    }
    
}

struct Clock: View {
    var counter: Int
    var countTo: Int
    
    var body: some View {
        VStack {
            Text(counterToMinutes())
                .font(.title3)
                .fontWeight(.regular)
        }
    }
    
    func counterToMinutes() -> String {
        let currentTime = countTo - counter
        let seconds = currentTime % 60
        let minutes = Int(currentTime / 60)
        
        return "\(minutes):\(seconds < 10 ? "0": "")\(seconds)"
        
        
    }
    
//    struct ActivityTimerView_Previews: PreviewProvider {
//        static var previews: some View {
//            ActivityTimerWatch(countTo: 0)
//        }
//    }
}

