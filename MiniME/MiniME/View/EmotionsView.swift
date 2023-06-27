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
    @State var mineMeImage: String = "original"
    @Environment(\.managedObjectContext) var managedObjectContext
    

    var body: some View {
        NavigationStack{
            ZStack{
                Color("Background-Color")
                    .ignoresSafeArea()
                VStack {

                    Text("Como estamos nos sentindo?")
                        .foregroundColor(.black)
                        .font(Font.custom("MoreSugarThin", size: 40))

                    Image(mineMeImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 350, height: 350)
                        .padding(.bottom, 40)
                    HStack(spacing: 70) {

                        Button {
                            triste.toggle()
                            self.mineMeImage = "feliz"

                        } label: {
                            Text("🥰")
                                .font(.system(size: 25))
                                .foregroundColor(.black)
                                .background {
                                    Rectangle()
                                        .frame(width: 80, height: 60)
                                        .foregroundColor(Color("Button-Color"))
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
                            self.mineMeImage = "superfeliz"
                        } label: {
                            Text("😁")
                                .font(.system(size: 25))
                                .foregroundColor(.black)
                                .background {
                                    Rectangle()
                                        .frame(width: 80, height: 60)
                                        .foregroundColor(Color("Button-Color"))
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
                            self.mineMeImage = "triste"
                        } label: {
                            Text("☹️")
                                .font(.system(size: 25))
                                .foregroundColor(.black)
                                .background {
                                    Rectangle()
                                        .frame(width: 80, height: 60)
                                        .foregroundColor(Color("Button-Color"))
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
                            self.mineMeImage = "supertriste"
                        } label: {
                            Text("😭")
                                .font(.system(size: 25))
                                .foregroundColor(.black)
                                .background {
                                    Rectangle()
                                        .frame(width: 80, height: 60)
                                        .foregroundColor(Color("Button-Color"))
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
                        updateMiniMe(emotion: mineMeImage, context: managedObjectContext)
                        dismiss()
                    } label: {
                        Text("Continuar")
                            .foregroundColor(.white)

                            .background {
                                Rectangle()
                                    .frame(width: 150, height: 60)
                                    .foregroundColor(Color("Button-Color"))
                                    .foregroundColor(.white)
                                    .cornerRadius(12)
                                    .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 3) // << shadow to all composition
                            }

                    }
                    .padding(.top, 70)
                }
            }
        }
    }
}

struct FeelingSheet_Previews: PreviewProvider {
    static var previews: some View {
        FeelingSheet()
    }
}
