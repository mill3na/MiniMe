//
//  PickerPropriedadeView.swift
//  MiniME
//
//  Created by Marília de Sousa on 14/06/23.
//

import SwiftUI

struct SegmentedControlView: View {
    @State var selected = "Alta"
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .init(named:("Progress-Color"))
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
    }
    
    var body: some View {
        
        Picker(selection: $selected, label: Text("Picker"), content: {
            Text("Alta").tag("Alta")
            Text("Média").tag("Média")
            Text("Baixa").tag("Baixa")
        })
        .pickerStyle(SegmentedPickerStyle())
        .background(Color("Icon-Color"))
    }
}

struct SegmentedControlView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedControlView()
    }
}
