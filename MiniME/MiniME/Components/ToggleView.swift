//
//  ToggleView.swift
//  MiniME
//
//  Created by Marília de Sousa on 15/06/23.
//

import SwiftUI

struct ToggleView: View {
    
    var title: String
    var description: String
    var isOn: Binding<Bool>

    var body: some View {
        
        Toggle(isOn: isOn) {
            VStack(alignment: .leading){
                Text(title)
                Text(description)
                    .foregroundColor(Color("Icon-Color"))
                    .font(.system(size: 12))
            }
        }
    }
}


