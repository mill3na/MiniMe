//
//  ContentView.swift
//  PocCircleProgressView
//
//  Created by Milena Maia Araújo on 06/06/23.
//

import SwiftUI

let timer = Timer
    .publish(every: 1, on: .main, in: .common)
    .autoconnect()

struct ActivityTimerView: View {
    @State var counter: Int = 0
    @State var isPaused: Bool = false
    @State private var showingSheet: Bool = false
    @State private var isPlaying: Bool = false
    var countTo: Int // change this parameter when calling the view. This is the time in minutes.
    
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    self.isPlaying.toggle()
                    
                } label: {
                    Image(systemName: self.isPlaying == true ? "speaker.slash.fill" : "speaker.wave.2.fill")
                          .resizable()
                          .frame(width: 29, height: 24)
                          .padding(30)
                          .accentColor(Color("Button-Color"))
                }

                Spacer()
            }
            Spacer()
            Spacer()
            
            ZStack (alignment: .center) {
                Circle()
                    .fill(Color.clear)
                    .frame(width: 250, height: 250)
                    .overlay(
                        Circle().stroke(Color("Button-Color"), lineWidth: 35))
                
                Circle()
                    .fill(Color.clear)
                    .frame(width: 250, height: 250)
                    .overlay(
                        Circle().trim(from: 0, to: progress())
                            .stroke(style:
                                        StrokeStyle(
                                            lineWidth: 25,
                                            lineCap: .round,
                                            lineJoin: .round)
                                   )
                            .foregroundColor(
                                (completed() ? Color.white : Color.white))
                            .animation (
                                .easeInOut(duration: 0.2))
                    )
                
                VStack (spacing: -40) {
                    Image("Icon-miniME")
                        .resizable()
                        .frame(width: 180, height: 180)

                }
                
            }
            Clock(counter: counter, countTo: countTo)
                .font(Font.custom("MoreSugarThin", size: 80))
                .padding()
                
                VStack {
                    Text("MineMe")
                        .foregroundColor(.black)
                        .padding()
                        .font(Font.custom("MoreSugarThin", size: 30))
                    HStack {
                        pauseButtonComponent(text: "Pausar", activity: pause)
                            .foregroundColor(.white)
                        Spacer()
                        ButtonComponent(text: "Finalizar", activity: endTimer)
                        
                        
                        
                            .sheet(isPresented: $showingSheet) {
                                FeelingSheet()
                            }
                    } .padding(90)
                    
                }

            Spacer()

        } .background(Color("Background-Color")) // vstack
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

    struct ActivityTimerView_Previews: PreviewProvider {
        static var previews: some View {
            ActivityTimerView(countTo: 0)
        }
    }
}


