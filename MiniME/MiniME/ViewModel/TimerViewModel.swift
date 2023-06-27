//
//  TimerViewModel.swift
//  MiniME
//
//  Created by Marília de Sousa on 14/06/23.
//

import SwiftUI



class TimerViewModel: ObservableObject {
    
    @Published var selectedHoursAmount = 0
    @Published var selectedMinutesAmount = 0
    @Published var selectedSecondsAmount = 0

    let hoursRange = 0...23
    let minutesRange = 0...59
    let secondsRange = 0...59
}

struct TimerView: View {
    @ObservedObject var model: TimerViewModel
    var body: some View {
        HStack(){
            TimerPickerView(title: "horas",
                            range: model.hoursRange,
                            binding: $model.selectedHoursAmount)
            TimerPickerView(title: "min",
                            range: model.minutesRange,
                            binding: $model.selectedMinutesAmount)
            TimerPickerView(title: "s",
                            range: model.secondsRange,
                            binding: $model.selectedSecondsAmount)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(.black)
        .foregroundColor(.black)
    }
}

