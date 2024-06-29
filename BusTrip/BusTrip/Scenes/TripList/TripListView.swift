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
    
    @State private var showPopover = false
    
    // Init coordinates for Barcelona
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 41.38074, longitude: 2.18594), span: MKCoordinateSpan(latitudeDelta: 0.3, longitudeDelta: 0.3))
    )
    
    var body: some View {
        
        VStack {
            
            contentView
        }
        .toolbar(content: {
            ToolbarItem(placement: .topBarTrailing) {
                
                Button(action: {
                    
                    showPopover = true
                    
                }, label: {
                    Image(systemName: "pencil.and.list.clipboard")
                        .foregroundColor(Color.surfaceSelected)
                })
            }
        })
        .popover(isPresented: $showPopover) {
         
            ReportView()
        }
        .task {
            
            showPopover = false
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
                    
                    Marker("Origin",
                           systemImage: "bus.fill",
                           coordinate: CLLocationCoordinate2D(latitude: selectedTrip.origin.lat, longitude: selectedTrip.origin.lon))
                    .tint(Color.surface)
                    
                    ForEach(selectedTrip.stops) { stop in
                        
                        Annotation("",
                                   coordinate: CLLocationCoordinate2D(latitude: stop.lat, longitude: stop.lon)) {
                            
                            Circle()
                                .fill(Color.surface)
                                .frame(width: Constants.iconHeight, height: Constants.iconHeight)
                                .overlay {
                                    Image(systemName: "figure.walk")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                }
                        }
                    }
                    
                    Marker("Destination",
                           systemImage: "bus.fill",
                    coordinate: CLLocationCoordinate2D(latitude: selectedTrip.destination.lat, longitude: selectedTrip.destination.lon))
                    .tint(Color.surface)
                    
                    if let routeCoordinates = viewModel.getTripRoute(trip: selectedTrip) {
                        MapPolyline(MKPolyline(coordinates: routeCoordinates,
                                               count: routeCoordinates.count))
                        .stroke(Color.surfaceSelected, lineWidth: 5)
                    }
                }
            }
                .mapStyle(.standard(elevation: .realistic))
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
            
            if viewModel.trips.isEmpty {
            
                Text("Oops, Looks that there are no trips available!")
                
            } else {
                
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
            .scrollContentBackground(.hidden)
            .listStyle(PlainListStyle())
            }
        }
        .frame(height: Constants.tripListHeight)
        .background(
            RoundedCornersShape(radius: Constants.borderRadius, corners: [.topLeft, .topRight])
                .fill(Color.primaryBackground)
        )
    }
    
    func updatePosition(trip: Trip) {
        
        withAnimation {
            position = MapCameraPosition.region(MKCoordinateRegion(center: viewModel.getMidCoordinate(trip: trip),
                                                                   span: MKCoordinateSpan(latitudeDelta: 0.3, longitudeDelta: 0.3)))
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
