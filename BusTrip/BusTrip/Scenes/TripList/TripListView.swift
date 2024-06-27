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
    
    // Init coordinates for Barcelona
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 41.38074, longitude: 2.18594), span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
    )
    
    var body: some View {
        
        VStack {
            
            VStack {
                
                content
            }
        }
        .task {
            
            viewModel.getTrips()
        }
    }
}

extension TripListView {
    
    @ViewBuilder
    var content: some View {
        
        switch viewModel.state {
        case .idle:
            idleView
        case .loading:
            loadingView
        case .loaded:
            loadedView
        case .failed(let error):
            failedView(error: error)
        }
    }
    
    @ViewBuilder
    var idleView: some View {
        
        EmptyView()
    }
    
    @ViewBuilder
    var loadingView: some View {
        
        VStack {
            
            Spacer()
            
            HStack {
                
                Spacer()
                
                ProgressView()
                
                Spacer()
            }
            
            Spacer()
        }
    }
    
    @ViewBuilder
    var loadedView: some View {
        
        VStack {
            
            Map(position: $position,
                interactionModes: [.rotate, .pan, .zoom]) {
                
                if let selectedTrip = viewModel.selectedTrip {
                    
                    Marker("Origin",
                           systemImage: "bus.fill",
                           coordinate: CLLocationCoordinate2D(latitude: selectedTrip.origin.lat, longitude: selectedTrip.origin.lon))
                    
                    ForEach(selectedTrip.stops) { stop in
                        
                        Annotation("",
                                   coordinate: CLLocationCoordinate2D(latitude: stop.lat, longitude: stop.lon)) {
                            
                            Circle()
                                .fill(Color.surface)
                                .frame(width: 20, height: 20)
                                .overlay {
                                    Image(systemName: "circle.circle")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                }
                        }
                    }
                    
                    Marker("Destination",
                           systemImage: "bus.fill",
                    coordinate: CLLocationCoordinate2D(latitude: selectedTrip.destination.lat, longitude: selectedTrip.destination.lon))
                    
                    if let routeCoordinates = viewModel.getTripRoute(trip: selectedTrip) {
                        MapPolyline(MKPolyline(coordinates: routeCoordinates,
                                               count: routeCoordinates.count))
                        .stroke(Color.surfaceSelected, lineWidth: 5)
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
    
    @ViewBuilder
    func failedView(error: String) -> some View {
        
        // TODO
        EmptyView()
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
                            position = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: trip.origin.lat,
                                                                                                                  longitude: trip.origin.lon),
                                                                                   span: MKCoordinateSpan(latitudeDelta: 0.8, longitudeDelta: 0.8)))
                        }
                    }
                }
                .padding([.top, .leading, .trailing], Constants.padding)
                .padding(.bottom, Constants.paddingXL)
                .listRowSeparatorTint(.clear)
                    .listRowBackground(Color.clear)
                    .listRowInsets(EdgeInsets())
            }
            .scrollContentBackground(.hidden)
            .listStyle(PlainListStyle())
        }
        .frame(height: Constants.tripListHeight)
        .background(
            RoundedCornersShape(radius: Constants.borderRadius, corners: [.topLeft, .topRight])
                .fill(Color.primaryBackground)
        )
    }
}

#Preview {
    TripListView()
}
