import SwiftUI
struct Itinerario: View {
    @State var selectedBusName: String = ""
    @State private var showSheet = false
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        ZStack{
            Color(.cor)
                .ignoresSafeArea()
            ScrollView{
                VStack{
                    Text("Itinerários")
                        .font(.largeTitle)
                        .bold()
                    ForEach(viewModel.chars, id: \.self) { i in
                        HStack{
                            ZStack{
                                Circle()
                                    .foregroundStyle(.gray)
                                    .frame(height: 50)
                                Image(systemName: "bus")
                                    .foregroundStyle(.yellow)
                                    .clipShape(Circle())
                            }
                            Text(i.nome!)
                            Spacer()
                        }.onTapGesture {
                            selectedBusName = i.nome!
                            showSheet = true
                            print(selectedBusName)
                        }.padding()
                    }
                    Spacer()
                }.onAppear(){
                    viewModel.fetch()
                }.sheet(isPresented: $showSheet) {
                    sheetview(nomizinho : $selectedBusName)
                }
            }
        }
    }
}

struct sheetview: View {
    
    
    @Binding var nomizinho : String
    
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        ScrollView{
            VStack{
                Text(nomizinho)
                    .font(.largeTitle)
                    .bold()
                    .padding()
                if (nomizinho == "Ônibus G"){
                    VStack{
                        HStack{
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(.blue)
                                    .frame(width: 100,height: 40)
                                Text("HORÁRIOS")
                                
                            }.padding()
                            Spacer()
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(.green)
                                    .frame(width: 200,height: 40)
                                    .padding()
                                Text("PONTOS DE PARADAS")
                            }
                        }
                        Rectangle()
                            .frame(height: 1)
                    }
                    HStack{
                        Text("6:14")
                            .padding()
                        Spacer()
                        Text("Univasf Campus Juazeiro")
                            .padding()
                    }.padding()
                    Rectangle()
                        .frame(height: 1)
                    HStack{
                        Text("6:19")
                            .padding()
                        Spacer()
                        Text("Terminal de Juazeiro")
                            .padding()
                    }.padding()
                    Rectangle()
                        .frame(height: 1)
                    HStack{
                        Text("6:23")
                            .padding()
                        Spacer()
                        Text("Verdão (Juazeiro)")
                            .padding()
                    }.padding()
                    Rectangle()
                        .frame(height: 1)
                    HStack{
                        Text("6:27")
                            .padding()
                        Spacer()
                        Text("Univasf Campus Petrolina")
                            .padding()
                    }.padding()
                    Rectangle()
                        .frame(height: 1)
                    HStack{
                        Text("6:33")
                            .padding()
                        Spacer()
                        Text("Feira da Cohab Massangano")
                            .padding()
                    }.padding()
                    Rectangle()
                        .frame(height: 1)
                    HStack{
                        Text("6:35")
                            .padding()
                        Spacer()
                        Text("Estrada do bairro Quati")
                            .padding()
                    }.padding()
                    Rectangle()
                        .frame(height: 1)
                    HStack{
                        Text("6:40")
                            .padding()
                        Spacer()
                        Text("Univasf Campus Ciências Agrárias")
                            .padding()
                    }.padding()
                    Rectangle()
                        .frame(height: 1)
                    HStack{
                        Text("9:10")
                            .padding()
                        Spacer()
                        Text("Univasf Campus Juazeiro")
                            .padding()
                    }.padding()
                    Rectangle()
                        .frame(height: 1)
                    HStack{
                        Text("9:12")
                            .padding()
                        Spacer()
                        Text("Terminal Juazeiro")
                            .padding()
                    }.padding()
                    Rectangle()
                        .frame(height: 1)
                    HStack{
                        Text("9:14")
                            .padding()
                        Spacer()
                        Text("Rodoviaria Petrolina")
                            .padding()
                    }.padding()
                    Rectangle()
                        .frame(height: 1)
                    HStack{
                        Text("9:18")
                            .padding()
                        Spacer()
                        Text("Caixa D'água da Compesa")
                            .padding()
                    }.padding()
                    Rectangle()
                        .frame(height: 1)
                    HStack{
                        Text("9:20")
                            .padding()
                        Spacer()
                        Text("Univasf Campus Petrolina")
                            .padding()
                    }.padding()
                    Rectangle()
                        .frame(height: 1)
                    HStack{
                        Text("9:25")
                            .padding()
                        Spacer()
                        Text("G Barbosa Petrolina")
                            .padding()
                    }.padding()
                    Rectangle()
                        .frame(height: 1)
                    HStack{
                        Text("9:45")
                            .padding()
                        Spacer()
                        Text("Univasf Campus Ciências Agrárias")
                            .padding()
                    }.padding()
                    Rectangle()
                        .frame(height: 1)
                }else{
                    if nomizinho == "Ônibus L"{
                        VStack{
                            HStack{
                                ZStack{
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundColor(.blue)
                                        .frame(width: 100,height: 40)
                                    Text("HORÁRIOS")
                                }.padding()
                                Spacer()
                                ZStack{
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundColor(.green)
                                        .frame(width: 200,height: 40)
                                        .padding()
                                    Text("PONTOS DE PARADAS")
                                }
                            }
                            Rectangle()
                                .frame(height: 1)
                            HStack{
                                Text("6:40")
                                    .padding()
                                Spacer()
                                Text("Univasf Campus Juazeiro")
                                    .padding()
                            }.padding()
                            Rectangle()
                                .frame(height: 1)
                            
                            HStack{
                                Text("6:49")
                                    .padding()
                                Spacer()
                                Text("Feira da Cohab Massangano")
                                    .padding()
                            }.padding()
                            Rectangle()
                                .frame(height: 1)
                            HStack{
                                Text("6:50")
                                    .padding()
                                Spacer()
                                Text("Entrada do Bairro Quati")
                                    .padding()
                            }.padding()
                            Rectangle()
                                .frame(height: 1)
                            HStack{
                                Text("6:55")
                                    .padding()
                                Spacer()
                                Text("Univasf Campus Ciências Agrárias")
                                    .padding()
                            }.padding()
                            Rectangle()
                                .frame(height: 1)
                            HStack{
                                Text("6:57")
                                    .padding()
                                Spacer()
                                Text("Hospita Veterinário")
                                    .padding()
                            }.padding()
                            Rectangle()
                                .frame(height: 1)
                            HStack{
                                Text("7:00")
                                    .padding()
                                Spacer()
                                Text("Bloco de Salas CCA")
                                    .padding()
                            }.padding()
                            Rectangle()
                                .frame(height: 1)
                            HStack{
                                Text("15:10")
                                    .padding()
                                Spacer()
                                Text("Univasf Campus Ciências Agrárias")
                                    .padding()
                            }.padding()
                            Rectangle()
                                .frame(height: 1)
                            HStack{
                                Text("15:23")
                                    .padding()
                                Spacer()
                                Text("Entrada N2")
                                    .padding()
                            }.padding()
                            Rectangle()
                                .frame(height: 1)
                            HStack{
                                Text("15:36")
                                    .padding()
                                Spacer()
                                Text("Feira da Cohab Massangano")
                                    .padding()
                            }.padding()
                            Rectangle()
                                .frame(height: 1)
                            HStack{
                                Text("15:40")
                                    .padding()
                                Spacer()
                                Text("Univasf Campus Juazeiro")
                                    .padding()
                            }.padding()
                            Rectangle()
                                .frame(height: 1)
                        }
                    }else{
                        VStack{
                            HStack{
                                ZStack{
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundColor(.blue)
                                        .frame(width: 100,height: 40)
                                    Text("HORÁRIOS")
                                }.padding()
                                Spacer()
                                ZStack{
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundColor(.green)
                                        .frame(width: 200,height: 40)
                                        .padding()
                                    Text("PONTOS DE PARADAS")
                                }
                            }
                        }
                    }
                }
            }
        }.background(.cor)
    }
}



#Preview {
    Itinerario()
}
