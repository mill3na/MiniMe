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
    
    @AppStorage("username") var username: String = "Anonymous"
    
    let container = CKContainer(identifier: "iCloud.miniMe")
    @State var mineMeName: String = "MineMe"
    @Environment(\.managedObjectContext) var managedObjectContext
    
    
    var body: some View {
        NavigationStack{
            VStack {
                
                Image("Icon-miniME")
                    .resizable()
                    .scaledToFit()
                    .padding(1)
                
                Text(mineMeName)
                    .foregroundColor(.black)
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
                
            } .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("Background-Color")) .ignoresSafeArea()
            
            
            
        }
        .onAppear {
            let mineMeFetch = fetchMineMe(context: managedObjectContext)
            if let mineMeName = mineMeFetch[0].name {
                self.mineMeName = mineMeName
            }
        }
        //        .navigationBarBackButtonHidden()
    }
}

struct MinimeView_Previews: PreviewProvider {
    static var previews: some View {
        MinimeView()
    }
}
