//
//  preferancias.swift
//  UNIBUS
//
//  Created by Turma01-27 on 10/10/24.
//

import SwiftUI

struct preferencias: View {
    @StateObject var viewModel = ViewModel()
    @State var selection: unibus?
    @State var selection1: unibus?
    @State var selection2: unibus?
    @State var selection3: unibus?
    
    var body: some View {
        ZStack{
            Color.cor.ignoresSafeArea()
            VStack(){
                Text("")
                Spacer()
                    Text("Preferências:")
                        .font(.title).padding()
                        .padding(.horizontal, -160).bold()
              
                Text("Ônibus 1").bold()
                        .padding(.horizontal, -140)
                
                Picker("Select a paint color", selection: $selection) {
                    ForEach(viewModel.chars, id: \.self) { p in
                        Text(p.nome!)
                            Spacer()
                        }
                }.padding(.horizontal,90).padding(.vertical,9)
                .accentColor(.jo)
                .background(Color.gray).cornerRadius(20.0).frame(width: 890)
                .cornerRadius(12.0)
                
                Text("Ônibus 2").bold()
                    .padding(.horizontal, -140)
                
                Picker("Select a paint color", selection: $selection1) {
                    ForEach(viewModel.chars, id: \.self) { p in
                        Text(p.nome!)
                            
                    }
                }.padding(.horizontal,90).padding(.vertical,9)
                .accentColor(.jo)
                .background(Color.gray).cornerRadius(20.0).frame(width: 890)
                .cornerRadius(12.0)
                
                Text("Ônibus 3").bold()
                    .padding(.horizontal, -140)
                
                Picker("Select a paint color", selection: $selection2) {
                    ForEach(viewModel.chars, id: \.self) { p in
                        Text(p.nome!)
                    }
                }.padding(.horizontal,90).padding(.vertical,9)
                .accentColor(.jo)
                .background(Color.gray).cornerRadius(20.0).frame(width: 890)
                .cornerRadius(12.0)
                
                Text("Ônibus 4").bold()
                    .padding(.horizontal, -140)
                
                Picker("Select a paint color", selection: $selection3) {
                    ForEach(viewModel.chars, id: \.self) { p in
                        
                        Text(p.nome!)
                    }
                }.padding(.horizontal,90).padding(.vertical,9)
                .pickerStyle(.menu)
                .accentColor(.jo)
                .background(Color.gray).cornerRadius(20.0).frame(width: 890)
                .cornerRadius(12.0)
                
                Spacer()
                Spacer()
                Button("Salvar"){
                    global.selections?.append(selection!)
                    global.selections?.append(selection1!)
                    global.selections?.append(selection2!)
                    global.selections?.append(selection3!)
                    global.buli = true
                }
                .frame(height: 40)
                .frame(width: 280)
                .background(Color.white)
                .foregroundColor(.black)
                .cornerRadius(15.0)
                Spacer()
            }
            .onAppear(){
                viewModel.fetch()
            }
        }
    }
}
#Preview {
    preferencias()
}
