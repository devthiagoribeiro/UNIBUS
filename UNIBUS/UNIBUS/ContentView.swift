//
//  ContentView.swift
//  UNIBUS
//
//  Created by Turma01-27 on 10/10/24.
//

import SwiftUI

struct ContentView: View {
    @State var isPresenting = false
    @State var tabSelection = 0
    var body: some View {
        ZStack{
            TabView{
                mapa()
                    .tabItem{
                        Label("Mapa", systemImage: "map.fill")
                    }
                rotas()
                    .tabItem{
                        Label("Rotas", systemImage: "bus.fill")
                    }
                Itinerario()
                    .tabItem{
                        Label("Itinerarios", systemImage: "clock.badge")
                    }
                alertas()
                    .tabItem{
                        Label("Alertas", systemImage: "exclamationmark.brakesignal")
                    }
                preferencias()
                    .tabItem{
                        Label("Preferencias", systemImage: "person.fill.questionmark")
                    }
            }
            .animation(.spring(), value: tabSelection)
        }
    }
}
#Preview {
    ContentView()
}

