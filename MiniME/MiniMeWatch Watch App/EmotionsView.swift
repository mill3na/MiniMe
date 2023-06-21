//
//  EmotionsView.swift
//  MiniMeWatch Watch App
//
//  Created by Ana Raiany Guimarães Gomes on 2023-06-19.
//

import Foundation
import SwiftUI

struct FeelingSheet: View {
    //    @State var shouldPresentSheet = false
    @State var feliz = false
    @State var triste = false
    @State var muitoFeliz = false
    @State var muitoTriste = false
    
    var body: some View {
        VStack(spacing: 10) {
            
            Image("MiniMe")
                .resizable()
                .aspectRatio(1, contentMode: .fit)            
            buttons
            
            Button {
                //                activity()
            } label: {
                Text("Continuar")
                    .foregroundColor(.black)
                    .frame(width: 110, height: 30)
                    .background {
                        Rectangle()
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
            }
            .buttonStyle(.borderless)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
    
    var buttons: some View {
        HStack(spacing: 5) {
            Button {
                feliz.toggle()
                //                activity()
            } label: {
                Text("🥰")
                    .font(.system(size: 15))
                    .frame(width: 40, height: 30)
                    .background {
                        Rectangle()
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .onChange(of: feliz) { newValue in
                                if  feliz == true {
                                    triste = false
                                    muitoFeliz = false
                                    muitoTriste = false
                                }
                            }
                    }
            }
            
            Button {
                triste.toggle()
            } label: {
                Text("🙂")
                    .font(.system(size: 15))
                    .foregroundColor(.black)
                    .frame(width: 40, height: 30)
                    .background {
                        Rectangle()
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .onChange(of: triste) { newValue in
                                if triste == true {
                                    feliz = false
                                    muitoFeliz = false
                                    muitoTriste = false
                                }
                            }
                    }
            }
            
            Button {
                muitoFeliz.toggle()
            } label: {
                Text("☹️")
                    .font(.system(size: 15))
                    .foregroundColor(.black)
                    .frame(width: 40, height: 30)
                    .background {
                        Rectangle()
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .onChange(of: muitoFeliz) { newValue in
                                if muitoFeliz == true {
                                    feliz = false
                                    triste = false
                                    muitoTriste = false
                                }
                                
                            }
                    }
            }
            
            Button {
                muitoTriste.toggle()
            } label: {
                Text("😭")
                    .font(.system(size: 15))
                    .foregroundColor(.black)
                    .frame(width: 40, height: 30)
                    .background {
                        Rectangle()
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .onChange(of: muitoTriste) { newValue in
                                if muitoTriste == true {
                                    feliz = false
                                    triste = false
                                    muitoFeliz = false
                                }
                            }
                    }
            }
            
            
        }
            .buttonStyle(.borderless)
    }
}

struct FeelingSheet_Previews: PreviewProvider {
    static var previews: some View {
        FeelingSheet()
    }
}
