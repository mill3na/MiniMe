//
//  pauseButtonComponent.swift
//  MiniMeWatch Watch App
//
//  Created by Ana Raiany Guimarães Gomes on 2023-06-19.
//

import SwiftUI

struct PauseButtonComponent: View {
    @State var text: String
    let activity: () -> ()
    @State var isPaused: Bool = false
    
    var body: some View {
        Button {
            activity()
            isPaused.toggle()
        } label: {
            Text(isPaused ? "Retomar" : text)
            
                .foregroundColor(.black)
                .background {
                    Rectangle()
                        .frame(width: 120, height: 60, alignment: .center)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 3) // << shadow to all composition
                }
        }
    }
}

