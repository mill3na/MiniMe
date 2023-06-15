//
//  TimerPickerView.swift
//  MiniME
//
//  Created by Marília de Sousa on 14/06/23.
//

import SwiftUI

struct TimerPickerView: View {
    private let pickerViewTitlePadding: CGFloat = 4.0
    @Environment(\.presentationMode) var presentationmode
    
    let title: String
    let range: ClosedRange<Int>
    let binding: Binding<Int>
 
    
    var body: some View {
        HStack(spacing: pickerViewTitlePadding) {
            Picker(title, selection: binding) {
                ForEach(range, id: \.self) {
                    timeIncrement in
                    HStack {
                        Spacer()
                        Text("\(timeIncrement)")
                            .foregroundColor(.black)
                            .multilineTextAlignment(.trailing)
                        }
                    }
                }
            }
            .foregroundColor(.white)
//          .pickerStyle(InlinePickerStyle())
            .labelsHidden()
    
            Text(title)
                .foregroundColor(.black)
                .fontWeight(.bold)
        }
    }
