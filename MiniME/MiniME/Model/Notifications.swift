//
//  Notifications.swift
//  MiniME
//
//  Created by Ana Caroline Sampaio Nogueira on 22/06/23.
//

import Foundation


enum NotificationModeCarol {
    case none
    case goTogether
    case letsGo
    case justLooking

//    var minutes: Int {
//        switch self {
//            case .goTogether:
//                return 60 * 10
//            case .letsGo:
//                return
//            case .justLooking:
//                return 1
//            case .none:
//                return 0
//        }
//    }
}

class NotificationViewModel: ObservableObject {
    @Published var notificationMode: NotificationMode = .middle

}
