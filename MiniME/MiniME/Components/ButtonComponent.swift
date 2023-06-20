//
//  ButtonComponent.swift
//  PocCircleProgressView
//
//  Created by Milena Maia Araújo on 12/06/23.
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
            
                .foregroundColor(.white)
                .background {
                    Rectangle()
                        .frame(width: 120, height: 60, alignment: .center)
                        .foregroundColor(Color("Button-Color"))
                        .cornerRadius(12)
                        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 3) // << shadow to all composition
                }
        }
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
//struct ButtonComponent_Previews: PreviewProvider {
//    static var previews: some View {
//        ButtonComponent(text: "retornar", activity: () -> ())
//    }
//}
