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
                        .foregroundStyle(.white)
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
                                .foregroundStyle(.white)
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
                    .foregroundStyle(.white)
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
                            .foregroundStyle(.white)
                    }
                    HStack{
                        Text("6:14")
                            .foregroundStyle(.white)
                            .padding()
                        Spacer()
                        Text("Univasf Campus Juazeiro")
                            .foregroundStyle(.white)
                            .padding()
                    }.padding()
                    Rectangle()
                        .frame(height: 1)
                        .foregroundStyle(.white)
                    HStack{
                        Text("6:19")
                            .foregroundStyle(.white)
                            .padding()
                        Spacer()
                        Text("Terminal de Juazeiro")
                            .foregroundStyle(.white)
                            .padding()
                    }.padding()
                    Rectangle()
                        .frame(height: 1)
                        .foregroundStyle(.white)
                    HStack{
                        Text("6:23")
                            .foregroundStyle(.white)
                            .padding()
                        Spacer()
                        Text("Verdão (Juazeiro)")
                            .foregroundStyle(.white)
                            .padding()
                    }.padding()
                    Rectangle()
                        .frame(height: 1)
                        .foregroundStyle(.white)
                    HStack{
                        Text("6:27")
                            .foregroundStyle(.white)
                            .padding()
                        Spacer()
                        Text("Univasf Campus Petrolina")
                            .foregroundStyle(.white)
                            .padding()
                    }.padding()
                    Rectangle()
                        .frame(height: 1)
                        .foregroundStyle(.white)
                    HStack{
                        Text("6:33")
                            .foregroundStyle(.white)
                            .padding()
                        Spacer()
                        Text("Feira da Cohab Massangano")
                            .foregroundStyle(.white)
                            .padding()
                    }.padding()
                    Rectangle()
                        .frame(height: 1)
                        .foregroundStyle(.white)
                    HStack{
                        Text("6:35")
                            .foregroundStyle(.white)
                            .padding()
                        Spacer()
                        Text("Estrada do bairro Quati")
                            .foregroundStyle(.white)
                            .padding()
                    }.padding()
                    Rectangle()
                        .frame(height: 1)
                        .foregroundStyle(.white)
                    HStack{
                        Text("6:40")
                            .foregroundStyle(.white)
                            .padding()
                        Spacer()
                        Text("Univasf Campus Ciências Agrárias")
                            .foregroundStyle(.white)
                            .padding()
                    }.padding()
                    Rectangle()
                        .frame(height: 1)
                        .foregroundStyle(.white)
                    HStack{
                        Text("9:10")
                            .foregroundStyle(.white)
                            .padding()
                        Spacer()
                        Text("Univasf Campus Juazeiro")
                            .foregroundStyle(.white)
                            .padding()
                    }.padding()
                    Rectangle()
                        .frame(height: 1)
                        .foregroundStyle(.white)
                    HStack{
                        Text("9:12")
                            .foregroundStyle(.white)
                            .padding()
                        Spacer()
                        Text("Terminal Juazeiro")
                            .foregroundStyle(.white)
                            .padding()
                    }.padding()
                    Rectangle()
                        .frame(height: 1)
                        .foregroundStyle(.white)
                    HStack{
                        Text("9:14")
                            .foregroundStyle(.white)
                            .padding()
                        Spacer()
                        Text("Rodoviaria Petrolina")
                            .foregroundStyle(.white)
                            .padding()
                    }.padding()
                    Rectangle()
                        .frame(height: 1)
                        .foregroundStyle(.white)
                    HStack{
                        Text("9:18")
                            .foregroundStyle(.white)
                            .padding()
                        Spacer()
                        Text("Caixa D'água da Compesa")
                            .foregroundStyle(.white)
                            .padding()
                    }.padding()
                    Rectangle()
                        .frame(height: 1)
                        .foregroundStyle(.white)
                    HStack{
                        Text("9:20")
                            .foregroundStyle(.white)
                            .padding()
                        Spacer()
                        Text("Univasf Campus Petrolina")
                            .foregroundStyle(.white)
                            .padding()
                    }.padding()
                    Rectangle()
                        .frame(height: 1)
                        .foregroundStyle(.white)
                    HStack{
                        Text("9:25")
                            .foregroundStyle(.white)
                            .padding()
                        Spacer()
                        Text("G Barbosa Petrolina")
                            .foregroundStyle(.white)
                            .padding()
                    }.padding()
                    Rectangle()
                        .frame(height: 1)
                        .foregroundStyle(.white)
                    HStack{
                        Text("9:45")
                            .foregroundStyle(.white)
                            .padding()
                        Spacer()
                        Text("Univasf Campus Ciências Agrárias")
                            .foregroundStyle(.white)
                            .padding()
                    }.padding()
                    Rectangle()
                        .frame(height: 1)
                        .foregroundStyle(.white)
                }else{
                    if nomizinho == "Ônibus J"{
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
                                .foregroundStyle(.white)
                            HStack{
                                Text("6:40")
                                    .foregroundStyle(.white)
                                    .padding()
                                Spacer()
                                Text("Univasf Campus Juazeiro")
                                    .foregroundStyle(.white)
                                    .padding()
                            }.padding()
                            Rectangle()
                                .frame(height: 1)
                                .foregroundStyle(.white)
                            
                            HStack{
                                Text("6:49")
                                    .foregroundStyle(.white)
                                    .padding()
                                Spacer()
                                Text("Feira da Cohab Massangano")
                                    .foregroundStyle(.white)
                                    .padding()
                            }.padding()
                            Rectangle()
                                .frame(height: 1)
                                .foregroundStyle(.white)
                            HStack{
                                Text("6:50")
                                    .foregroundStyle(.white)
                                    .padding()
                                Spacer()
                                Text("Entrada do Bairro Quati")
                                    .foregroundStyle(.white)
                                    .padding()
                            }.padding()
                            Rectangle()
                                .frame(height: 1)
                                .foregroundStyle(.white)
                            HStack{
                                Text("6:55")
                                    .foregroundStyle(.white)
                                    .padding()
                                Spacer()
                                Text("Univasf Campus Ciências Agrárias")
                                    .foregroundStyle(.white)
                                    .padding()
                            }.padding()
                            Rectangle()
                                .frame(height: 1)
                                .foregroundStyle(.white)
                            HStack{
                                Text("6:57")
                                    .foregroundStyle(.white)
                                    .padding()
                                Spacer()
                                Text("Hospita Veterinário")
                                    .foregroundStyle(.white)
                                    .padding()
                            }.padding()
                            Rectangle()
                                .frame(height: 1)
                                .foregroundStyle(.white)
                            HStack{
                                Text("7:00")
                                    .foregroundStyle(.white)
                                    .padding()
                                Spacer()
                                Text("Bloco de Salas CCA")
                                    .foregroundStyle(.white)
                                    .padding()
                            }.padding()
                            Rectangle()
                                .frame(height: 1)
                                .foregroundStyle(.white)
                            HStack{
                                Text("15:10")
                                    .foregroundStyle(.white)
                                    .padding()
                                Spacer()
                                Text("Univasf Campus Ciências Agrárias")
                                    .foregroundStyle(.white)
                                    .padding()
                            }.padding()
                            Rectangle()
                                .frame(height: 1)
                                .foregroundStyle(.white)
                            HStack{
                                Text("15:23")
                                    .foregroundStyle(.white)
                                    .padding()
                                Spacer()
                                Text("Entrada N2")
                                    .foregroundStyle(.white)
                                    .padding()
                            }.padding()
                            Rectangle()
                                .frame(height: 1)
                                .foregroundStyle(.white)
                            HStack{
                                Text("15:36")
                                    .foregroundStyle(.white)
                                    .padding()
                                Spacer()
                                Text("Feira da Cohab Massangano")
                                    .foregroundStyle(.white)
                                    .padding()
                            }.padding()
                            Rectangle()
                                .frame(height: 1)
                                .foregroundStyle(.white)
                            HStack{
                                Text("15:40")
                                    .foregroundStyle(.white)
                                    .padding()
                                Spacer()
                                Text("Univasf Campus Juazeiro")
                                    .foregroundStyle(.white)
                                    .padding()
                            }.padding()
                            Rectangle()
                                .frame(height: 1)
                                .foregroundStyle(.white)
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
