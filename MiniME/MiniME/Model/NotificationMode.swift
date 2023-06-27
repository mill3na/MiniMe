//
//  NotificationMode.swift
//  MiniME
//
//  Created by Ana Caroline Sampaio Nogueira on 22/06/23.
//

import Foundation

enum NotificationMode: String {
    case each10minutes = "Vamos juntos"
    case middle = "Chego já"
    case startEnd = "Fico olhando"

    func notificationDates(startDate: Date = Date(), minutesTime: Int) -> [Date] {
        let duration = TimeInterval(exactly: minutesTime)!
        switch self {
            case .each10minutes:
                return each10Minutes(
                    startDate: startDate,
                    minuteTimes: duration
                )
            case .middle:
                return middle(
                    startDate: startDate,
                    minuteTimes: duration
                )
            case .startEnd:
                return startEnd(
                    startDate: startDate,
                    minuteTimes: duration
                )
        }
    }

    private func middle(startDate: Date = Date(), minuteTimes: TimeInterval) -> [Date] {
        [
            startDate.advanced(by: 3),
            startDate.advanced(by: minuteTimes / 2),
            startDate.advanced(by: minuteTimes)
        ]
    }

    //end
    private func startEnd(startDate: Date = Date(), minuteTimes: TimeInterval) -> [Date] {
        [
            startDate.advanced(by: 3),
            startDate.advanced(by: minuteTimes)
        ]
    }

    //each10Minutes
    private func each10Minutes(startDate: Date = Date(), minuteTimes: TimeInterval) -> [Date] {
        var each10MinutesDate = startDate
        let endDate = startEnd(startDate: startDate, minuteTimes: minuteTimes).last!
        var dates: [Date] = [startDate.advanced(by: 3)]

        // se tiver duração o bastante pra fazer notificacao de 10 em 10 minutos...
        if minuteTimes >= 10 * 60 {
            print(startDate.formatted(date: .abbreviated, time: .complete))
            while(each10MinutesDate < endDate) {
                each10MinutesDate = each10MinutesDate.addingTimeInterval(60 * 10)
                dates.append(each10MinutesDate)
            }
            return dates
        } else {
            return [endDate]
        }
    }

}
