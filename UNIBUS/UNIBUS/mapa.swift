//
//  mapa.swift
//  UNIBUS
//
//  Created by Turma01-27 on 10/10/24.
//

import SwiftUI
import MapKit

struct mapa: View {
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: -9.413454, longitude: -40.513541),
            span: MKCoordinateSpan(latitudeDelta: 0.015, longitudeDelta: 0.015)))
    var body: some View {
        ZStack{
            Map(position: $position)
            {
            }
        }
    }
}

#Preview {
    mapa()
}
