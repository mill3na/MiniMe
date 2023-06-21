//
//  ButtonComponent.swift
//  MiniMeWatch Watch App
//
//  Created by Ana Raiany Guimarães Gomes on 2023-06-19.
//

import SwiftUI

struct pauseButtonComponent: View {
    @State var text: String
    let activity: () -> ()
    @State var isPaused: Bool = false
    
    var body: some View {
        Button {
            activity()
            isPaused.toggle()
        } label: {
            Text(isPaused ? "Retomar" : text)
                .frame(width: 80, height: 30, alignment: .center)
                .foregroundColor(.black)
                .background {
                    Rectangle()
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
        }
        .buttonStyle(.borderless)

    }
}

struct ButtonComponent: View {
    @State var text: String
    let activity: () -> ()
    
    var body: some View {
        Button {
            activity()
        } label: {
            Text(text)
                .frame(width: 80, height: 30, alignment: .center)
                .foregroundColor(.black)
                .background {
                    Rectangle()
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
        }
        .buttonStyle(.borderless)
    }
}
//struct ButtonComponent_Previews: PreviewProvider {
//    static var previews: some View {
//        ButtonComponent(text: "retornar", activity: () -> ())
//    }
//}
