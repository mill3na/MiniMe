
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

    func dispatchNotification(notifications: [NotificationModel], at date: Date, title: String, body: String) {

        // Logica que dependento do modo vai adicionar notificacoes

        let notificationCenter = UNUserNotificationCenter.current()

        let model = notifications.randomElement()!
        let content = UNMutableNotificationContent()
        content.title = model.title
        content.body = model.body
        let dateComponents = Calendar.current.dateComponents(
            [.day, .month, .year, .hour, .minute, .second],
            from: date
        )
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        let request = UNNotificationRequest(identifier: "", content: content, trigger: trigger)
        notificationCenter.add(request)




//        let identifier = "my-morning-notification"
//
//        switch {
//            case modo1:
//                return notficationStart
//
//            default: return
//        }
//
//        let title = "Nome do modo!"
//        let body = "Mensagem de foco!"
//        // variavel que recebe o tempo que o usuário digitou
//        //            let hour = 10
//        //            let minute = 58
//        let isDaily = true
//        let notificationCenter = UNUserNotificationCenter.current()
//        let content = UNMutableNotificationContent()
//        content.title = title
//        content.body = body
//        content.sound = .default
//
//        //            let calendar = Calendar.current
//        //            var dateComponents = DateComponents(calendar: calendar, timeZone: TimeZone.current)
//        //            dateComponents.hour = hour
//        //            dateComponents.minute = minute
//        let dateComponents = Calendar.current.dateComponents(
//            [.day, .month, .year, .hour, .minute, .second],
//            from: date
//        )
//
//        // Vai repetir notificações?
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: isDaily)
//        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
//
//        notificationCenter.removePendingNotificationRequests(withIdentifiers: [identifier])
//        notificationCenter.add(request)
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

    static var delegate: NotificationDelegate = NotificationDelegate()

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

    static func scheduleNotification(model: NotificationModel, at date: Date) {

        UNUserNotificationCenter.current().delegate = delegate

        let identifier = "my-morning-notification"
        let title = model.title
        let body = model.body
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

class NotificationDelegate: NSObject, UNUserNotificationCenterDelegate {
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void)
    {
        // Update the app interface directly.

        // Show a banner
        completionHandler(.banner)
    }
}
