//
//  ContentView.swift
//  Collection MP
//
//  Created by Ana Caroline Sampaio Nogueira on 12/06/23.
//

import SwiftUI
import CloudKit

struct AtividadesView: View {

    let columns = [
        GridItem(.flexible()),
    ]

    let atividades: [ActivityModel] = [ActivityModel(titulo: "Yoga", imagem: "mini", hora: "11:00", inicio: "mini"),
                                       ActivityModel(titulo: "Skin Care", imagem: "mini", hora: "12:00", inicio: "mini"),
                                       ActivityModel(titulo: "Leitura", imagem: "mini", hora: "11:00", inicio: "mini"),
                                       ActivityModel(titulo: "Comer", imagem: "mini", hora: "11:00", inicio: "mini"),
    ]
    
    let container = CKContainer(identifier: "iCloud.miniMe")

    var body: some View {
        listCloudKitItems(viewModel: TaskViewModel(container: self.container))
    }

    struct AtividadesView_Previews: PreviewProvider {
        static var previews: some View {
            AtividadesView()
        }
    }
}

struct listCloudKitItems: View {
    
    @StateObject var viewModel: TaskViewModel
    
    init(viewModel: TaskViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    func deleteItem(_ indexSet: IndexSet) {
        indexSet.forEach { index in
            let task = viewModel.items[index]
            if let recordId = task.recordId {
                viewModel.deleteTask(recordId)
            }
        }
        
    }
    
    func priorityColor(priority: String) -> Color {
        var selectedColor = Color.gray
        if priority == "Alta" {
            selectedColor = Color.red
        } else if priority == "Media" || priority == "Média" {
            selectedColor = Color.yellow
        } else {
            selectedColor = Color.green
        }
        return selectedColor.opacity(0.6)
    }
    
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
    
    var body: some View {
        VStack {
            List {
                ForEach(viewModel.items, id: \.recordId) { item in
                    
                    HStack {
                        
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 5, height: 70)
                            .foregroundColor(priorityColor(priority: item.priority))
                            
                        Image("Icon-miniME")
                            .resizable()
                            .frame(width: 60 , height: 60, alignment: .bottom)
                            .padding(12)
                        VStack (alignment: .leading){
                            Text("\(item.title)")
                                .font(.title2)
                                .fontWeight(.medium)
                            Text("\(Clock(counter: 0, countTo: item.minutesTime).counterToMinutes()) min")

                                .font(.none)
                                .fontWeight(.regular)
                                
                        } .padding(.bottom)

                        Spacer()
                        NavigationLink {
                            ActivityTimerView(countTo: item.minutesTime)
                            
                        } label: {
                        }
                        .buttonStyle(.plain)
                        .padding(10)
                    }
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                    .padding(10)
                    .background {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(.white)
                            .shadow(radius: 2, x: 2, y: 2)
                    }
                }.onDelete(perform: deleteItem)
                
            } .navigationTitle("Minhas Atividade")
            .foregroundColor(Color("Icon-Color"))
            .modifier(FormHiddenBackground())
            .background(Color("Background-Color"))
            .listStyle(.plain)

        } .onAppear {
            viewModel.populateTasks()
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink {
                    NovAtividade(viewModel: self.viewModel)
                } label: {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .padding()
                }
            }
        }
    }
}
