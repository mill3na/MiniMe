//
//  SwiftUIView.swift
//  MiniME
//
//  Created by Thaynara da Silva Andrade on 19/06/23.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
        struct CustomToggleStyle: ToggleStyle {
            func makeBody(configuration: Configuration) -> some View {
                Toggle(configuration.label, isOn: configuration.$isOn)
                    .toggleStyle(SwitchToggleStyle(tint: Color.blue)) // Modifique a cor desejada aqui
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
