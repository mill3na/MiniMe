//
//  PickerPropriedadeView.swift
//  MiniME
//
//  Created by Marília de Sousa on 14/06/23.
//

import SwiftUI

struct SegmentedControlView: View {
    @State var selected = 1
    
    var body: some View {
        Picker(selection: $selected, label: Text("Picker"), content: {
            Text("Alta").tag(1)
            Text("Média").tag(2)
            Text("Baixa").tag(3)
        })
        .pickerStyle(SegmentedPickerStyle())
    }
}

struct SegmentedControlView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedControlView()
    }
}
