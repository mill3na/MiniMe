//
//  NovaAtividadeView.swift
//  MiniME
//
//  Created by Ana Caroline Sampaio Nogueira on 15/06/23.
//

import Foundation
import SwiftUI

struct NovaAtividadeView: View {

    var body: some View {
        VStack {
            Image("Icon-miniME")
                .resizable()
                .scaledToFit()
                .padding()
                
            
            HStack{
                Button {
                    //                activity()
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

                Button {
                    //                activity()
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
        } .frame(maxWidth: .infinity, alignment: .trailing)
        .background(Color("Background-Color"))
    }

}

struct NovaAtividadeView_Previews: PreviewProvider {
    static var previews: some View {
        NovaAtividadeView()
    }
}
