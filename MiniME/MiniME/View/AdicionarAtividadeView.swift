//
//  NovAtividade.swift
//  MiniME
//
//  Created by Marília de Sousa on 14/06/23.
//

import SwiftUI

struct NovAtividade: View {

    @State private var atividade = ""
    @State private var intervalo = ""
    @State private var modoToggle1 = false
    @State private var modoToggle2 = false
    @State private var modoToggle3 = false

    var body: some View {
        VStack {
            NavigationView {
                Form {
                    Section(header: Text("")){
                        TextField("Nome da Atividade", text: $atividade)
                    }

                    Section(header: Text("Tempo da Atividade")){
                        TimerView()
                    }

                    Section(header: Text("Prioridade")){
                        SegmentedControlView()
                    }
                    Section(header: Text("Modo")){
                        ToggleView(title: "Vamos juntos", description: "Lembretes a cada 10 min", isOn: $modoToggle1)
                            .onChange(of: modoToggle1) { newValue in
                                if  modoToggle1 == true {
                                    modoToggle2 = false
                                    modoToggle3 = false
                                }
                            }
                        ToggleView(title: "Chego já", description: "1 Lembrete durante a atividade", isOn: $modoToggle2)
                            .onChange(of: modoToggle2) { newValue in
                                if  modoToggle2 == true {
                                    modoToggle1 = false
                                    modoToggle3 = false
                                }
                            }
                        ToggleView(title: "Fico olhando", description: "Lembretes apenas no início e fim da atividade", isOn: $modoToggle3)
                            .onChange(of: modoToggle3) { newValue in
                                if modoToggle3 == true {
                                    modoToggle2 = false
                                    modoToggle1 = false
                                }
                                
                            }
                    }

                    .navigationTitle("Nova Atividade")
//                  .labelsHidden()

                    }
                    .navigationBarItems(
                        leading: EditButton(),
                        trailing:
                            NavigationLink("Add", destination: Text("Destination"))
                    )
                }
            }
        }

            struct NovAtividade_Previews: PreviewProvider {
                static var previews: some View {
                    NovAtividade()
            }
        }
    }
