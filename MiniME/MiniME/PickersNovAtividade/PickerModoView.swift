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
