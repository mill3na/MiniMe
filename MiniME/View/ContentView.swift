//
//  ContentView.swift
//  MiniME
//
//  Created by Milena Maia Araújo on 12/06/23.
//

import SwiftUI
import CoreData

struct ContentView: View {

    
    @State var soundOn = false
    @State private var bgColor = Color.white

    var body: some View {
        NavigationView {
            List {
                // 1
                Toggle("Sons", isOn: $soundOn)
                VStack {
                    ColorPicker("Cor do MiniMe", selection: $bgColor)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                NavigationLink {
                    CredistsView()
                } label: {
                    Text("Créditos")
                }
            }
        }
    }
}

struct CredistsView: View {
    var body: some View {
        VStack {
            Text("Créditos")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(20)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MinimeView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
