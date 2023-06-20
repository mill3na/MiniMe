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
    @State private var modoToggle1 = false
    @State private var modoToggle2 = false
    @State private var modoToggle3 = false
    @State private var title: String = ""
    @State var didSaveTask = false
    @State var priority: String = "Alta"
    @StateObject var viewModel: TaskViewModel
    @StateObject private var timerModel = TimerViewModel()
    
    
    let container = CKContainer(identifier: "iCloud.miniMe")
    
    
    
    
    func checkMode() -> String {
        if self.modoToggle1 == true {
            return "Vamos juntos"
        } else if self.modoToggle2 == true {
            return "Chego já"
        } else {
            return "Fico olhando"
        }
    }
    
    var body: some View {
        
        
            VStack {
                
                NavigationStack {
                    
                    
                    Form {
                        
                        Section(header: Text("Atividade")){
                            TextField("Nome da Atividade", text: $title)
                        } .foregroundColor(Color("Icon-Color"))
                        
                        Section(header: Text("Tempo da Atividade")){
                            TimerView(model: timerModel)
                        } .foregroundColor(Color("Icon-Color"))
                        
                        Section(header: Text("Prioridade")){
                            PriorityPicker().pickerStyle(SegmentedPickerStyle())
                                .cornerRadius(8)
                                .listRowBackground(Color("Icon-Color"))
                                //.shadow(radius: 2, x: 2, y:2)
                            
                            
                        } .foregroundColor(Color("Icon-Color"))
                            
                        
                        
                        
                        Section(header: Text("Modo")){
                            VStack {
                                ToggleView(title: "Vamos juntos", description: "Lembretes a cada 10 min", isOn: $modoToggle1)
                                    .onChange(of: modoToggle1) { newValue in
                                        if  modoToggle1 == true {
                                            modoToggle2 = false
                                            modoToggle3 = false
                                        }
                                    } .padding(.vertical)
                                    .tint(Color("Icon-Color"))
                                Divider()

                                ToggleView(title: "Chego já", description: "Um Lembrete durante a atividade", isOn: $modoToggle2)
                                    .onChange(of: modoToggle2) { newValue in
                                        if  modoToggle2 == true {
                                            modoToggle1 = false
                                            modoToggle3 = false
                                        }
                                    } .padding(.vertical)
                                    .tint(Color("Icon-Color"))
                                Divider()
                                
                                
                                ToggleView(title: "Fico olhando", description: "Lembretes apenas no início e fim da atividade", isOn: $modoToggle3)
                                    .onChange(of: modoToggle3) { newValue in
                                        if modoToggle3 == true {
                                            modoToggle2 = false
                                            modoToggle1 = false
                                        }
                                        
                                    } .padding(.vertical)
                                      .tint(Color("Icon-Color"))
                                
                                
                                    
                            }
                        }
                        .foregroundColor(Color("Icon-Color"))
                    }
//                    .shadow(radius: 2, x: 2, y:2)
                    .modifier(FormHiddenBackground())
                        
                        .background(Color("Background-Color"))
                    .navigationTitle("Nova Atividade")
                    
                    
                    
                }.toolbar
                {
                    
                    // 2
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            let minutesTime = viewModel.calculateTotalSeconds(hours: timerModel.selectedHoursAmount, minutes: timerModel.selectedMinutesAmount, seconds: timerModel.selectedSecondsAmount)
                            print("PRIORITY: \(priority)")
                            viewModel.saveTask(title: title, priority: String(priority), mode: checkMode(), minutesTime: minutesTime)
                            self.title = ""
                            didSaveTask = true
                        } label: {
                            Text("Salvar")
                                .foregroundColor(Color("Button-Color"))
                        }
                        .navigationDestination(isPresented: $didSaveTask) {
                            AtividadesView()
                        }
                    }
                }
            }
    }
    
}






struct NovAtividade_Previews: PreviewProvider {
    static var previews: some View {
        let container = CKContainer(identifier: "iCloud.miniMe")
        NovAtividade(viewModel: TaskViewModel(container: container))
    }
}
//view



struct FormHiddenBackground: ViewModifier {
    func body(content: Content) -> some View {
        if #available(iOS 16.0, *) {
            content.scrollContentBackground(.hidden)
        } else {
            content.onAppear {
                UITableView.appearance().backgroundColor = .clear
            }
            .onDisappear {
                UITableView.appearance().backgroundColor = .systemGroupedBackground
            }
        }
    }
}

struct PriorityPicker: View {
    @State var priority: String = "Alta"
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .white
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
    }
    
    var body: some View {
        
        VStack {
            Picker (
                selection: $priority,
                label: Text("PRIORIDADE"),
                content: {
                    Text("Alta").tag("Alta")
                    Text("Média").tag("Media")
                    Text("Baixa").tag("Baixa")
                    
                }).pickerStyle(SegmentedPickerStyle())
                .background(.clear)
    
            

        } 
    }
}
