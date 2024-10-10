//
//  rotas.swift
//  UNIBUS
//
//  Created by Turma01-27 on 10/10/24.
//

import SwiftUI
import MapKit

struct rotas: View {
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: -9.413454, longitude: -40.513541),
            span: MKCoordinateSpan(latitudeDelta: 0.015, longitudeDelta: 0.015)))
    @State private var selection = "Ônibus L"
        let busList = ["Ônibus F", "Ônibus J", "Ônibus G", "Ônibus M", "Ônibus I"]
            
    var body: some View {
        ZStack(alignment: .top){
            Map(position: $position)
            {
            }
            ZStack(alignment: .center){
                Rectangle().frame(width: 300, height: 70)
                        .cornerRadius(20)
                    .foregroundColor(.mblack)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            }
            VStack{
                Picker("Select", selection: $selection) {
                    ForEach(busList, id: \.self) {
                        Text($0)
                    }
                }
                    .pickerStyle(.menu)
                    .accentColor(.textcolor)
                }
            .padding(.top)
        }
    }
}

#Preview {
    rotas()
}
