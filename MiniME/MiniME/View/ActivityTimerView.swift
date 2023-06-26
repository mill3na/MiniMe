import SwiftUI
import AVFoundation

let timer = Timer
    .publish(every: 1, on: .main, in: .common)
    .autoconnect()

struct ActivityTimerView: View {
    @State var counter: Int = 0
    @State var isPaused: Bool = false
    @State private var showingSheet: Bool = false
    @State private var isPlaying: Bool = false
    @State private var audioPlayer: AVAudioPlayer?
    var countTo: Int
    let audioURL = Bundle.main.url(forResource: "song", withExtension: "mp3")

    @State var isFinished = false

    var body: some View {
        if isFinished {
            FeelingSheet()
        } else {
            content
        }
    }

    var content: some View {
        VStack {
            HStack {
                Button {
                    self.isPlaying.toggle()
                    if self.isPlaying {
                        playMusic()
                    } else {
                        stopMusic()
                    }
                } label: {
                    Image(systemName: self.isPlaying ? "speaker.wave.2.fill" : "speaker.slash.fill")
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
                Text("MiniMe")
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

    func justlookingNotification() {
        let identifier = "my-morning-notification"
        let title = "Nome do modo!"
        let body = "Mensagem de foco!"
        // variavel que recebe o tempo que o usuário digitou
//            let hour = 10
//            let minute = 58
        let isDaily = true
        let notificationCenter = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = .default

        let calendar = Calendar.current
        var dateComponents = DateComponents(calendar: calendar, timeZone: TimeZone.current)
//            dateComponents.hour = hour
//            dateComponents.minute = minute

        // Vai repetir notificações?
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: isDaily)
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)

        notificationCenter.removePendingNotificationRequests(withIdentifiers: [identifier])
        notificationCenter.add(request)
    }

    func pause() {
        if self.isPaused {
            self.isPaused = false
            initTimer()
            if isPlaying {
                playMusic()
            }
        } else {
            self.isPaused = true
            stopMusic()
        }
    }

    func initTimer() {
        if self.counter < self.countTo {
            self.counter += 1
        }
    }

    func endTimer() {
        self.counter = self.countTo
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.isFinished = true
            //            self.showingSheet.toggle()
        }
    }

    func completed() -> Bool {
        return progress() == 1
    }

    func progress() -> CGFloat {
        return CGFloat(counter) / CGFloat(countTo)
    }

    func playMusic() {
        guard let audioURL = audioURL else { return }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioURL)
            audioPlayer?.play()
        } catch {
            print("Failed to play music: \(error)")
        }
    }

    func stopMusic() {
        audioPlayer?.stop()
        audioPlayer = nil
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
}

struct ActivityTimerView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityTimerView(countTo: 0)
    }
}

