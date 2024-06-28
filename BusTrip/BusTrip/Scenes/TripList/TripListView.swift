//
//  TripListView.swift
//  BusTrip
//
//  Created by Xavier Ramos on 26/6/24.
//

import SwiftUI
import MapKit

struct TripListView: View {
    
    @StateObject var viewModel: TripListViewModel = TripListViewModel()
    
    @State private var position: MapCameraPosition = .automatic
    
    var body: some View {
        
        VStack {
            
            VStack {
                
                contentView
            }
        }
        .task {
            
            viewModel.getTrips()
        }
    }
}

extension TripListView {
    
    @ViewBuilder
    var contentView: some View {
        
        VStack {
            
            Map(position: $position,
                interactionModes: [.rotate, .pan, .zoom]) {
                
                if let selectedTrip = viewModel.selectedTrip {
                    
                    Marker(selectedTrip.origin.address,
                           systemImage: Constants.markerImage,
                           coordinate: CLLocationCoordinate2D(latitude: selectedTrip.origin.lat, longitude: selectedTrip.origin.lon))
                    .tint(Color.surface)
                    
                    ForEach(selectedTrip.stops) { stop in
                        
                        Annotation("",
                                   coordinate: CLLocationCoordinate2D(latitude: stop.lat, longitude: stop.lon),
                                   anchor: .top) {
                            
                            annotationView(stop: stop)
                                .onTapGesture {
                                    viewModel.getStopDetail(stopId: stop.id)
                                }
                        }
                    }
                    
                    Marker(selectedTrip.destination.address,
                           systemImage: Constants.markerImage,
                    coordinate: CLLocationCoordinate2D(latitude: selectedTrip.destination.lat, longitude: selectedTrip.destination.lon))
                    .tint(Color.surface)
                    
                    if let routeCoordinates = viewModel.getTripRoute(trip: selectedTrip) {
                        MapPolyline(MKPolyline(coordinates: routeCoordinates,
                                               count: routeCoordinates.count))
                        .stroke(Color.surfaceSelected, lineWidth: Constants.lineWidth)
                    }
                }
            }
                .mapStyle(.standard(elevation: .realistic))
                .ignoresSafeArea()
                .overlay(alignment: .bottom, content: {
                    
                    tripsView
                })
                .ignoresSafeArea(edges: .bottom)
        }
    }
}

extension TripListView {
    
    @ViewBuilder
    var tripsView: some View {
        
        VStack {
            
            List {
                
                VStack(alignment: .leading) {
                    
                    ForEach(viewModel.trips) { trip in
                        
                        TripCardView(trip: trip,
                                     isSelected: viewModel.isSelected(trip: trip))
                        .onTapGesture {
                            
                            viewModel.setSelectedTrip(trip: trip)
                            updatePosition(trip: trip)
                        }
                    }
                }
                .padding([.top, .leading, .trailing], Constants.padding)
                .padding(.bottom, Constants.paddingXL)
                .listRowSeparatorTint(.clear)
                .listRowBackground(Color.clear)
                .listRowInsets(EdgeInsets())
            }
            .onEmpty(for: viewModel.trips.isEmpty,
                     with: "Oops, Looks that there are no trips available!")
            .scrollContentBackground(.hidden)
            .listStyle(PlainListStyle())
        }
        .frame(height: Constants.tripListHeight)
        .background(
            RoundedCornersShape(radius: Constants.borderRadius, corners: [.topLeft, .topRight])
                .fill(Color.primaryBackground)
        )
    }
    
    @ViewBuilder
    func annotationView(stop: Stop) -> some View {
        
        VStack(alignment: .center) {
            
            if viewModel.isSelected(stop: stop) {
                
                Text(viewModel.selectedStop?.address ?? "")
            }
                  
            ZStack {
                
                Circle()
                    .fill(Color.surface.opacity(0.5))
                    .frame(width: Constants.annotationHeight, 
                           height: Constants.annotationHeight)
                
                Image(systemName: Constants.annotationImage)
                    .padding(Constants.padding)
                    .foregroundStyle(.black)
                    .background(Color.surface)
                    .clipShape(Circle())
            }
        }
    }
    
    func updatePosition(trip: Trip) {
        
        withAnimation {
            position = MapCameraPosition.region(MKCoordinateRegion(center: viewModel.getMidCoordinate(trip: trip),
                                                                   span: MKCoordinateSpan(latitudeDelta: Constants.latitudeDelta, longitudeDelta: Constants.longitudeDelta)))
        }
    }
}

// MARK: - Previews

struct TripListView_ColorScheme_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ForEach(ColorScheme.allCases, id: \.self) {
            TripListView()
            .preferredColorScheme($0)
        }
    }
}
