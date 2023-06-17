//
//  PickerPropriedadeView.swift
//  MiniME
//
//  Created by Marília de Sousa on 14/06/23.
//

import SwiftUI

struct SegmentedControlView: View {
    @State var selected = "Alta"
    
    var body: some View {
        Picker(selection: $selected, label: Text("Picker"), content: {
            Text("Alta").tag("Alta")
            Text("Média").tag("Média")
            Text("Baixa").tag("Baixa")
        })
        .pickerStyle(SegmentedPickerStyle())
    }
}

struct SegmentedControlView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedControlView()
    }
}
