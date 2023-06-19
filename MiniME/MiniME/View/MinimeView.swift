//
//  MinimeView.swift
//  MiniME
//
//  Created by Ana Caroline Sampaio Nogueira on 15/06/23.
//

import Foundation
import SwiftUI
import CloudKit

struct MinimeView: View {
    
    let container = CKContainer(identifier: "iCloud.miniMe")
    
    var body: some View {
            NavigationStack{
                VStack {
                    
                    Image("Icon-MiniME")
                        .resizable()
                        .scaledToFit()
                        .padding(1)
                    
                    Text("MineMe")
                        .font(Font.custom("MoreSugarThin", size: 30))
                        .padding(28)
                    
                    NavigationLink {
                        NovAtividade(viewModel: TaskViewModel(container: self.container))
                        
                    } label: {
                        Text("Nova atividade")
                            .foregroundColor(.white)
                        
                            .background {
                                Rectangle()
                                    .accentColor(Color("Button-Color"))
                                    .frame(width: 180, height: 60)
                                    .cornerRadius(15)
                                    .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 3) // << shadow to all composition
                            }
                        
                    }
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("Background-Color"))
        }
    }
}
struct MinimeView_Previews: PreviewProvider {
    static var previews: some View {
        MinimeView()
    }
}
