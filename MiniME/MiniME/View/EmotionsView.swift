//
//  FeelingSheet.swift
//  SheetEmocoes
//
//  Created by Ana Caroline Sampaio Nogueira on 13/06/23.
//

import Foundation
import SwiftUI

struct FeelingSheet: View {

    @Environment(\.dismiss) var dismiss

    @State var feliz = false
    @State var triste = false
    @State var muitoFeliz = false
    @State var muitoTriste = false
    @State var miniMe = "original"
    @AppStorage("username") var username: String = "feeling"

    var body: some View {
        NavigationStack{
            VStack {
                Image(miniMe)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 350, height: 350)
                    .padding(.bottom, 100)
                    .padding(.top, 100)
                HStack(spacing: 70) {

                    Button {
                        triste.toggle()
                        self.miniMe = "triste"

                    } label: {
                        Image(systemName: "face.smiling")
                            .font(.system(size: 25))
                            .foregroundColor(.black)
                            .background {
                                Rectangle()
                                    .frame(width: 80, height: 60)
                                    .foregroundColor(.white)
                                    .cornerRadius(12)
                                    .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 3)
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
                        feliz.toggle()
                        self.miniMe = "supertriste"
                    } label: {
                        Image(systemName: "face.smiling")
                            .font(.system(size: 25))
                            .foregroundColor(.black)
                            .background {
                                Rectangle()
                                    .frame(width: 80, height: 60)
                                    .foregroundColor(.white)
                                    .cornerRadius(12)
                                    .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 3)
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
                        self.miniMe = "feliz"
                    } label: {
                        Image(systemName: "face.smiling")
                            .font(.system(size: 25))
                            .foregroundColor(.black)
                            .background {
                                Rectangle()
                                    .frame(width: 80, height: 60)
                                    .foregroundColor(.white)
                                    .cornerRadius(12)
                                    .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 3)
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
                        self.miniMe = "superfeliz"
                    } label: {
                        Image(systemName: "face.smiling")
                            .font(.system(size: 25))
                            .foregroundColor(.black)
                            .background {
                                Rectangle()
                                    .frame(width: 80, height: 60)
                                    .foregroundColor(.white)
                                    .cornerRadius(12)
                                    .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 3)
                                    .onChange(of: muitoFeliz) { newValue in
                                        if muitoFeliz == true {
                                            feliz = false
                                            triste = false
                                            muitoTriste = false
                                        }
                                    }
                            }


                    }
                    
                }
                //mudamos de botao e dismiss para navigation
                Button {
                    dismiss()
                } label: {
                    Text("Continuar")

                        .foregroundColor(.black)
                        .background {
                            Rectangle()
                                .frame(width: 150, height: 60)
                                .foregroundColor(.white)
                                .cornerRadius(12)
                                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 3) // << shadow to all composition
                        }

                }
                .padding(.top, 100)
            }
        }
    }
}

struct FeelingSheet_Previews: PreviewProvider {
    static var previews: some View {
        FeelingSheet()
    }
}
