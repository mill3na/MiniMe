//
//  NovaAtividadeView.swift
//  MiniME
//
//  Created by Ana Caroline Sampaio Nogueira on 15/06/23.
//

import Foundation
import SwiftUI
import CloudKit

struct NovaAtividadeView: View {

    var viewModel = TaskViewModel(container: CKContainer(identifier: "iCloud.miniMe"))
    var body: some View {
        NavigationStack {
            VStack {
                Image("minime")
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .padding(.bottom, 100)
                    .padding(.top, 150)
                
                HStack{
                    NavigationLink {
                        NovAtividade( viewModel: self.viewModel)
                    } label: {
                        Text("Nova atividade")
                        
                            .foregroundColor(.black)
                            .background {
                                Rectangle()
                                    .frame(width: 150, height: 60)
                                    .foregroundColor(.white)
                                    .cornerRadius(12)
                                    .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 3) // << shadow to all composition
                            }
                        
                    }
                    .padding(.trailing, 60)
                    
                    NavigationLink {
                        AtividadesView()
                    } label: {
                        Text("Minhas atividades")
                        
                            .foregroundColor(.black)
                            .background {
                                Rectangle()
                                    .frame(width: 150, height: 60)
                                    .foregroundColor(.white)
                                    .cornerRadius(12)
                                    .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 3) // << shadow to all composition
                            }
                        
                    }
                    
                }
            }
        }
        .navigationBarBackButtonHidden()
    }


}

struct NovaAtividadeView_Previews: PreviewProvider {
    static var previews: some View {
        NovaAtividadeView()
    }
}
