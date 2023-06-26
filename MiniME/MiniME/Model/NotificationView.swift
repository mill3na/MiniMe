
import SwiftUI
import UserNotifications

struct NotificationView: View {

    func checkForPermission() {
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.getNotificationSettings{ settings in
            switch settings.authorizationStatus {
                case .authorized:
                    print(":)")
                case .denied:
                    return
                case .notDetermined:
                    notificationCenter.requestAuthorization(options: [.alert, .sound]) { didAllow , error in
                        if didAllow {
                            print(":)")
                        }
                    }
                default:
                    return
            }

        }
    }

    func dispatchNotification(at date: Date) {
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

        //            let calendar = Calendar.current
        //            var dateComponents = DateComponents(calendar: calendar, timeZone: TimeZone.current)
        //            dateComponents.hour = hour
        //            dateComponents.minute = minute
        let dateComponents = Calendar.current.dateComponents(
            [.day, .month, .year, .hour, .minute, .second],
            from: date
        )

        // Vai repetir notificações?
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: isDaily)
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)

        notificationCenter.removePendingNotificationRequests(withIdentifiers: [identifier])
        notificationCenter.add(request)
    }

    var body: some View {
        VStack {
            Button("Request Permission") {
                checkForPermission()
            }
            Button("Schedule Notification") {

            }
        }


    }

    struct NotificationView_Previews: PreviewProvider {
        static var previews: some View {
            NotificationView()
        }
    }
}

struct Notification {

    static func checkForPermission() {
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.getNotificationSettings{ settings in
            switch settings.authorizationStatus {
                case .authorized:
                    print(":)")
                case .denied:
                    return
                case .notDetermined:
                    notificationCenter.requestAuthorization(options: [.alert, .sound]) { didAllow , error in
                        if didAllow {
                            print(":)")
                        }
                    }
                default:
                    return
            }

        }
    }

    static func scheduleNotification(at date: Date) {
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

        let dateComponents = Calendar.current.dateComponents(
            [.day, .month, .year, .hour, .minute, .second],
            from: date
        )

        // Vai repetir notificações?
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: isDaily)
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)

        notificationCenter.removePendingNotificationRequests(withIdentifiers: [identifier])
        notificationCenter.add(request)
        
    }
}
