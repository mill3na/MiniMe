//
//  PickerModoView.swift
//  MiniME
//
//  Created by Marília de Sousa on 14/06/23.
//

import SwiftUI

struct SegmentedControlModelView: View {
    @State var selected = 1
    
    var body: some View {
        Picker(selection: $selected, label: Text("Picker"),
               content: {
            Text("Vamos juntos").tag(1)
            Text("Chego já").tag(2)
            Text("Fico olhando").tag(3)
        })
        .pickerStyle(SegmentedPickerStyle())
    }
}

struct SegmentedControlModelView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedControlModelView()
    }
}

Button {
                    //                activity()
                } label: {
                    Image(systemName: "face.smiling")
                        .font(.system(size: 25))
                        .foregroundColor(.black)
                        .background {
                            Rectangle()
                                .frame(width: 80, height: 60)
                                .foregroundColor(.white)
                                .cornerRadius(12)
                                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 3) // << shadow to all composition
                        }
                }
