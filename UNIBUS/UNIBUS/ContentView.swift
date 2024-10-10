//
//  ContentView.swift
//  UNIBUS
//
//  Created by Turma01-27 on 10/10/24.
//

import SwiftUI
import BottomSheet

struct ContentView: View {
    @State var bottomSheetPosition: BottomSheetPosition = .absolute(180)
    @State var isPresenting = false
    @State var tabSelection = 0
    var body: some View {
        ZStack{
            TabView{
                mapa()
                    .bottomSheet(
                        bottomSheetPosition: $bottomSheetPosition,
                        switchablePositions: [.absolute(150),
                                              .absolute(325), .relative(0.95)],
                        headerContent: {
                            
                        },
                        mainContent: {
                            ScrollView{
                                HStack{
                                    VStack{
                                        HStack{
                                            ZStack{
                                                Circle()
                                                    .frame(width: 70, height: 70)
                                                    .foregroundColor(.white)
                                                Image(systemName: "bus.fill")
                                                    .resizable()
                                                    .foregroundColor(.black)
                                                    .frame(width: 30, height: 30)
                                            }
                                            
                                            VStack{                                            
                                                   HStack{
                                                    Text("Ônibus X")
                                                    .font(.headline)
                                                Spacer()
                                            }
                                                
                                                HStack{
                                                    Text("Avenida Monsenhor")
                                                    Spacer()
                                                }
                                            }
                                            
                                            Spacer()
                                            
                                        }
                                    }
                                    Spacer()
                                }
                                .padding(.leading)
                                Spacer()
                            }
                        }
                    )
                
                    .tabItem{
                        Label("Mapa", systemImage: "map.fill")
                    }
                    .toolbarBackground(.visible, for: .tabBar)
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
            


