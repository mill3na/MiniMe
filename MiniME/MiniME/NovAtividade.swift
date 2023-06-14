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
                        SegmentedControlModelView()
                    }
                    
                    
                    
                    .navigationTitle("Nova Atividade")
                    .labelsHidden()
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
