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
            center: CLLocationCoordinate2D(latitude: -9.405602091421292, longitude: -40.50435044802576),
            span: MKCoordinateSpan(latitudeDelta: 0.04, longitudeDelta: 0.001)))
    @StateObject var viewModel = ViewModel()
    @State var selection: String?
    @State var walkingRoute: [CLLocationCoordinate2D] = [ ]
    @State var stopies
    :[CLLocationCoordinate2D] = []
    
    @State var partida = ""
    @State var chegada = ""
    
    var body: some View {
        ZStack(alignment: .top){
            Map(position: $position)
            {
                MapPolyline(coordinates: walkingRoute)
                    .stroke(.blue, lineWidth: 6)
                if(walkingRoute.count > 0){
                    Marker(chegada, coordinate: walkingRoute[walkingRoute.count-1])
                    Annotation(partida, coordinate: walkingRoute[0]) {
                        ZStack {
                            Circle()
                                .strokeBorder(.textcolor, lineWidth: 10)
                                .frame(width: 20, height: 20)
                                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            Circle()
                                .strokeBorder(.textcolor, lineWidth: 5)
                                .frame(width: 40, height: 40)
                        }
                        
                    }
                
                ForEach(stopies, id: \.latitude) { stop in
                    if(stop.latitude != walkingRoute[0].latitude && stop.latitude != walkingRoute[walkingRoute.count-1].latitude){
                        Annotation("", coordinate: stop) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 5)
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.textcolor)
                                Image(systemName: "bus").foregroundColor(.mblack)
                            }
                            
                        }
                    }
                }
                }
                
            }
            
            ZStack(alignment: .center){
                Rectangle().frame(width: 300, height: 70)
                    .cornerRadius(20)
                    .foregroundColor(.mblack)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            }
            VStack{
                Picker("", selection: $selection) {
                    
                    Text("Selecione").tag(nil as String?)
                    
                    ForEach(viewModel.chars, id: \.letra) { p in
                        Text("Ônibus \(p.letra)").tag(p.letra as String?)
                    }
                }
                .pickerStyle(.menu)
                .accentColor(.textcolor)
                .onChange(of: selection) {
                    verify(seleced: selection!)
                    
                }
            }
            .padding(.top)
        }
        .onAppear(){
            viewModel.fetch()
        }
    }
    func verify(seleced:String){
        for i in viewModel.chars{
            if(i.letra == seleced){
                makeRoute(rota: i.rota)
                makeStopies(stops: i.parada)
                partida = i.partida!
                chegada = i.chegada!
            }
        }
    }
    
    func makeRoute(rota:[coordenadas]){
        walkingRoute.removeAll()
            for j in rota {
                walkingRoute.append(CLLocationCoordinate2D(latitude: j.latitude!, longitude: j.longitude!))
            }
    }
    
    func makeStopies(stops:[paradas]){
        stopies.removeAll()
        for i in stops{
            stopies.append(CLLocationCoordinate2D(latitude: i.lat!, longitude: i.long!))
        }
    }
}

#Preview {
    rotas()
}
