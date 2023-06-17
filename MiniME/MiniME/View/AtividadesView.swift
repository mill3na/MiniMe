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
//        NavigationView {
//
//            ScrollView {
//
//                LazyVGrid(columns: columns) {
//                    ForEach(atividades, id: \.self) { atividade in
//                        Rectangle()
//                            .frame(width: 400, height: 100)
//                            .foregroundColor(Color(red: 235/255, green: 235/255, blue: 235/255))
//                            .cornerRadius(10)
//                            .shadow(color: Color.primary.opacity(0.3), radius: 1)
//                            .overlay {
//                                HStack{
//                                    Image(atividade.imagem)
//                                        .resizable()
//                                        .frame(width: 70 , height: 70, alignment: .bottom)
//                                        .clipShape(Circle())
//                                        .padding(12)
//
//                                    VStack(alignment: .leading, spacing: 8) {
//                                        Text(atividade.titulo)
//                                            .font(.system(.title2, design: .rounded))
//                                        Text("11:00 am - 12:00 am")
//                                    }
//
//                                    Spacer()
//
//                                    Button {
//                                        print("Button pressed")
//                                    } label: {
//                                        Image(systemName: "play.circle")
//                                            .font(.system(size: 25))
//                                            .foregroundColor(Color.black)
//                                    }
//                                    .padding(12)
//                                }
//                            }
//                    }
//                }
//                Image("tarefas")
//                    .resizable()
//                    .frame(width: 200 , height: 220, alignment: .bottom)
//                    .padding(.top, 150)
//                    .padding(.trailing, 19)
//            }
//
//            .navigationTitle("Minhas atividades")
//            .navigationBarTitleDisplayMode(.inline)
//            .toolbar {
//                Button {
//                    print("Button pressed")
//                } label: {
//                    Image(systemName: "plus.circle")
//                        .foregroundColor(Color.black)
//                }
//
//            }
//        }
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
    
    var body: some View {
        VStack {
            List {
                ForEach(viewModel.items, id: \.recordId) { item in
                    
                    HStack {
                        
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 5, height: 70)
                            .foregroundColor(priorityColor(priority: item.priority))
                        Image("miniMe-cortado2")
                            .resizable()
                            .frame(width: 60 , height: 70, alignment: .bottom)
                            .padding(12)
                        VStack (alignment: .leading){
                            Text("\(item.title)")
                                .font(.title2)
                                .fontWeight(.medium)
                            Text("\(viewModel.calculateTotalMinutes(hours: 0, minutes: item.minutesTime, seconds: 0)) min")
                                .font(.title3)
                                .fontWeight(.regular)
                                
                        }

                        Spacer()
                        NavigationLink {
                            ActivityTimerView(countTo: item.minutesTime)
                            
                        } label: {
//                            Image(systemName: "play.circle")
//                                .font(.system(size: 25))
//                                .foregroundColor(Color.black)
                        }
                        .buttonStyle(.plain)
                        
                        .padding(12)
                    }
                }.onDelete(perform: deleteItem)
            }
        } .onAppear {
            viewModel.populateTasks()
        }
    }
}
