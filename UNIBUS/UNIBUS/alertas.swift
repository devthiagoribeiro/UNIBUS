//
//  alertas.swift
//  UNIBUS
//
//  Created by Turma01-27 on 10/10/24.
//
import SwiftUI

struct Alerta {
    var nome_bus: String
    var espec_bus: String
    var simbolo: String
    var cor: Color
}
struct alertas: View {
    let alertaExemplo = [
        Alerta(nome_bus: "Ônibus L", espec_bus: "Acabou de partir da Univasf - CCA", simbolo: "clock", cor: .green),
        Alerta(nome_bus: "Ônibus J", espec_bus: "Está Partindo da Univasf - Juazeiro", simbolo: "clock", cor: .blue),
        Alerta(nome_bus: "Ônibus C", espec_bus: "Está 15 min atrasado - Campus CCA", simbolo: "exclamationmark.triangle", cor: .red),
        Alerta(nome_bus: "Ônibus I", espec_bus: "Em manutenção", simbolo: "wrench", cor: .orange)
    ]
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        ZStack {
            Color("mblack")
                .ignoresSafeArea()
            
            VStack {
                Text("Alertas")
                    .font(.title)
                    .bold()
                
                ForEach(alertaExemplo, id: \.nome_bus) { alerta in
                    HStack {
                        Image(systemName: alerta.simbolo)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                        
                        VStack(alignment: .leading) {
                            Text(alerta.nome_bus)
                                .font(.headline)
                            Text(alerta.espec_bus)
                                .font(.subheadline)
                        }
                        
                        Spacer()
                        Circle()
                            .fill(alerta.cor)
                            .frame(width: 20, height: 20)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    Divider()
                        .background(Color.black)
                }
                
                Spacer()
                Image(systemName: "exclamationmark.brakesignal")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.gray)
                    .padding(.top, 20)
                    .badge(4)
            }
            .padding()
        }
    }
}
