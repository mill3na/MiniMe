//
//  NovAtividade.swift
//  MiniME
//
//  Created by Marília de Sousa on 14/06/23.
//

import SwiftUI
import CloudKit

struct NovAtividade: View {
    
    @State private var atividade = ""
    @State private var intervalo = ""
    
    let container = CKContainer(identifier: "iCloud.miniMe")
    @StateObject var viewModel: TaskViewModel
    @State private var title: String = ""

    
    var body: some View {
        VStack {
            NavigationView {
                Form {
                    Section(header: Text("")){
                        TextField("Nome da Atividade", text: $title)
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
                .toolbar {

                    // 2
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            let selectedPriority = SegmentedControlView().selected
                            let selectedMode = SegmentedControlModelView().selected
                            let minutesTime = TimerViewModel().selectedMinutesAmount
                            viewModel.saveTask(title: title, priority: String(selectedPriority), mode: String(selectedMode), minutesTime: minutesTime)
                            self.title = ""

                        } label: {
                            NavigationLink("Add", destination: AtividadesView())
                        }
                    }
                }
//                    .navigationBarItems(
//                        leading: EditButton(),
//                        trailing:
//                            NavigationLink("Add", destination:
//                                            listCloudKitItems(viewModel: TaskViewModel(container: self.container)))
//
//                                            //Text("Destination"))
//                    )
            }
            }
        }
        
            struct NovAtividade_Previews: PreviewProvider {
                static var previews: some View {
                    let container = CKContainer(identifier: "iCloud.miniMe")
                    NovAtividade(viewModel: TaskViewModel(container: container))
            }
        }
    }

