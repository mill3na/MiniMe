//
//  MultSelectorView.swift
//  MiniME
//
//  Created by Marília de Sousa on 15/06/23.
//
import SwiftUI

struct MultiSelector_Previews: PreviewProvider {
    struct IdentifiableString: Identifiable, Hashable {
        let string: String
        var id: String { string }
    }
    
    @State
    static var selected: Set<IdentifiableString> = Set(["A", "C"].map { IdentifiableString(string: $0) })
    
    static var previews: some View {
        NavigationView {
            Form {
                MultiSelector<Text, IdentifiableString>(
                    label: Text("Multiselect"),
                    options: ["A", "B", "C", "D"].map { IdentifiableString(string: $0) },
                    optionToString: { $0.string },
                    selected: $selected
                )
            }.navigationTitle("Title")
        }
    }
}

struct MultiSelector_Previews: PreviewProvider {
    struct IdentifiableString: Identifiable, Hashable {
        let string: String
        var id: String { string }
    }
  
   
    @State static var selected: Set<IdentifiableString> = Set(["A", "C"].map { IdentifiableString(string: $0) })
    
    static var previews: some View {
        NavigationView {
            Form {
                MultiSelector<Text, IdentifiableString>(
                    label: Text("Multiselect"),
                    options: ["A", "B", "C", "D"].map { IdentifiableString(string: $0) },
                    optionToString: { $0.string },
                    selected: $selected
                )
            }.navigationTitle("Title")
        }
    }
}
