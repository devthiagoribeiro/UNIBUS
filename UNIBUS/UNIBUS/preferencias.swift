//
//  preferancias.swift
//  UNIBUS
//
//  Created by Turma01-27 on 10/10/24.
//


//
//  preferancias.swift
//  UNIBUS
//
//  Created by Turma01-27 on 10/10/24.
//

import SwiftUI

struct preferencias: View {
    @StateObject var viewModel = ViewModel()
    
    @State var selection: String = "Ônibus I"
    @State var selection1: String = "Ônibus I"
    @State var selection2: String = "Ônibus I"
    @State var selection3: String = "Ônibus I"
    //    @State var boolAux = false
    
    
    var body: some View {
        ZStack{
            Color.mblack.ignoresSafeArea()
            
            VStack{
                
                Text("Preferências:")
                    .foregroundStyle(.textcolor)
                    .font(.title).padding()
                   /* .padding(.horizontal, -160)*/.bold()
                
                Text("Ônibus 1").bold().foregroundStyle(.textcolor)
                   // .padding(.horizontal, -140)
                
                
                ZStack {
                    Rectangle()
                        .frame(width: 270, height: 50)
                        .cornerRadius(20)
                        .foregroundColor(.gray)
                    Picker("Select a paint color", selection: $selection) {
                        ForEach(viewModel.chars, id: \.nome) { p in
                            Text(p.nome)
                        }
                    }
                    .accentColor(.textcolor)
                }
                
                Text("Ônibus 2").bold().foregroundStyle(.textcolor)
                   // .padding(.horizontal, -140)
                
                ZStack {
                    Rectangle()
                        .frame(width: 270, height: 50)
                        .cornerRadius(20)
                        .foregroundColor(.gray)
                    Picker("Select a paint color", selection: $selection1) {
                        ForEach(viewModel.chars, id: \.nome) { p in
                            Text(p.nome)
                        }
                    }
                    .accentColor(.textcolor)
                }
                
                Text("Ônibus 3").bold().foregroundStyle(.textcolor)
                   // .padding(.horizontal, -140)
                
                ZStack {
                    Rectangle()
                        .frame(width: 270, height: 50)
                        .cornerRadius(20)
                        .foregroundColor(.gray)
                    Picker("Select a paint color", selection: $selection2) {
                        ForEach(viewModel.chars, id: \.nome) { p in
                            Text(p.nome)
                        }
                    }
                    .accentColor(.textcolor)
                }
                
                
                Text("Ônibus 4").bold().foregroundStyle(.textcolor)
                   // .padding(.horizontal, -140)
                
                ZStack {
                    Rectangle()
                        .frame(width: 270, height: 50)
                        .cornerRadius(20)
                        .foregroundColor(.gray)
                    Picker("Select a paint color", selection: $selection3) {
                        ForEach(viewModel.chars, id: \.nome) { p in
                            Text(p.nome)
                        }
                    }
                    .accentColor(.textcolor)
                }
                

                    
                
                Button("Salvar"){
   
                    let bus1 =  viewModel.chars.filter{
                        $0.nome == selection
                    }
                    let bus2 =  viewModel.chars.filter{
                        $0.nome == selection1
                    }
                    let bus3 =  viewModel.chars.filter{
                        $0.nome == selection2
                    }
                    let bus4 =  viewModel.chars.filter{
                        $0.nome == selection3
                    }
                    
                    
                    var arrPref : [String] = []
                    arrPref.append(bus1.first!._id)
                    arrPref.append(bus2.first!._id)
                    arrPref.append(bus3.first!._id)
                    arrPref.append(bus4.first!._id)
                    
                    
                    
                    viewModel.post(p: unibusPref(ids: arrPref, date: Date().iso8601.dateFromISO8601))
                    
                    
                    viewModel.fetch()
                }.frame(height: 40)
                    .frame(width: 280)
                    .background(Color.textcolor)
                    .foregroundColor(.mblack)
                    .cornerRadius(15.0)
                    .padding(.top, 40)
                    
            }
        }
        .onAppear(){
            viewModel.fetch2()
            viewModel.fetch()
            //print(globalStruct.buli)
        }
    }
        
}


#Preview {
    preferencias()
}
