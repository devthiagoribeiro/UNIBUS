//
//  teste.swift
//  UNIBUS
//
//  Created by Turma01-27 on 10/10/24.
//

import SwiftUI

import SwiftUI
import MapKit

struct teste: View {
    @State private var selectedResult: MKMapItem?
    @State private var route: MKRoute?
    
    private let startingPoint = CLLocationCoordinate2D(
        latitude: -9.413454, longitude: -40.513541
    )
    
    private let destinationCoordinates = CLLocationCoordinate2D(
        latitude: -9.413004759626716,
        longitude: -40.50157406003588
    )
    
    var body: some View {
        Map(selection: $selectedResult) {
            // Adding the marker for the starting point
            Marker("Partida", coordinate: self.startingPoint)
            Marker("Destino final", coordinate: self.destinationCoordinates)
            
            // Show the route if it is available
            if let route {
                MapPolyline(route)
                    .stroke(.blue, lineWidth: 5)
            }
        }
        .onChange(of: selectedResult){
            getDirections()
        }
        .onAppear {
            self.selectedResult = MKMapItem(placemark: MKPlacemark(coordinate: self.destinationCoordinates))
        }
    }
    
    func getDirections() {
        self.route = nil
        
        // Check if there is a selected result
        guard let selectedResult else { return }
        
        // Create and configure the request
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: self.startingPoint))
        request.destination = self.selectedResult
        
        // Get the directions based on the request
        Task {
            let directions = MKDirections(request: request)
            let response = try? await directions.calculate()
            route = response?.routes.first
        }
    }
    
}

#Preview {
    teste()
}
