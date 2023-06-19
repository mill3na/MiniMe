//
//  OnboardingView.swift
//  MiniME
//
//  Created by Thaynara da Silva Andrade on 16/06/23.
//

import SwiftUI

struct OnboardingView: View {
    @State private var currentPage = 0
    @State private var answer = ""
    @State private var isOnboardingComplete = false
    
    var body: some View {
        ZStack {
            Color("Background-Color")
                .ignoresSafeArea()
            
            VStack {
                Spacer(minLength: 0)
                
                // Conteúdo do onboarding
                VStack {
                    GeometryReader { proxy in
                        VStack(spacing: 0) {
                            
                            if currentPage == 0 {
                                
                                Image("Balloon-icon1")
                                    .resizable()
                                    .scaledToFit()
                                
                                Image("Icon-miniME")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 0.5*proxy.size.height)
                                
                                Text("O MiniMe ajudará você \na manter o foco!")
                                    .foregroundColor(.black)
                                    .font(Font.custom("MoreSugarThin", size: 30))
                                    .multilineTextAlignment(.center)
                                    .padding()
                                
                            } else if currentPage == 1 {
                                
                                Image("Balloon-icon2")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 0.3*proxy.size.height)
                                
                                Image("Icon-miniME")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 0.5*proxy.size.height)
                                
                                Text("Escreva aqui nosso nome")
                                    .foregroundColor(.black)
                                    .font(Font.custom("MoreSugarThin", size: 30))
                                    .multilineTextAlignment(.center)
                                    .padding()
                                
                                
                                TextField("Digite o nome do seu MiniMe", text: $answer)
                                    .textFieldStyle(.automatic)
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 15)
                                    .background(Color.white)
                                    .cornerRadius(8)
                                    .padding(.horizontal, 22)
                                    .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
                                
                                
                            } else {
                                
                                Image("Balloon-icon3")
                                    .resizable()
                                    .scaledToFit()
                                
                                Image("Icon-miniME")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 0.5*proxy.size.height)
                                
                                
                                Text("Cadastre e personalize nossas novas atividades")
                                    .foregroundColor(.black)
                                    .font(Font.custom("MoreSugarThin", size: 30))
                                    .multilineTextAlignment(.center)
                                    .padding()
                            }
                        } .frame(width: proxy.size.width, height: proxy.size.height)
                    }
                } .padding(.all)
                
                
                
                // Barra de progresso
                HStack {
                    Spacer()
                    
                    ForEach(0..<3) { index in
                        Circle()
                            .frame(width: 20, height: 10)
                            .foregroundColor(index == currentPage ? Color("Button-Color") : Color("Progress-Color"))
                    }
                    
                    Spacer()
                }
                
                // Botões de navegação
                HStack {
                    if currentPage > 0 {
                        Button(action: {
                            currentPage -= 1
                        }) {
                            Text("Anterior")
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.accentColor)
                                .accentColor(Color("Button-Color"))
                                .cornerRadius(15)
                        }
                        .padding()
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        if currentPage < 2 {
                            currentPage += 1
                        } else {
                            isOnboardingComplete = true
                        }
                    }) {
                        Text(currentPage == 2 ? "Concluir" : "Próximo")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.accentColor)
                            .accentColor(Color("Button-Color"))
                            .cornerRadius(15)
                        
                    }
                } .padding()
            } .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .fullScreenCover(isPresented: $isOnboardingComplete, content: {
            MinimeView()
        })
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

