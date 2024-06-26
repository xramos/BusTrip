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
        
        ZStack {
            
            Map {
                
                // TODO: Add Marker and Annotations on task 2
                
            }.ignoresSafeArea()
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
                        
                        TripCardView(trip: trip)
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
