//
//  TripListView.swift
//  BusTrip
//
//  Created by Xavier Ramos on 26/6/24.
//

import SwiftUI

struct TripListView: View {
    
    @StateObject var viewModel: TripListViewModel = TripListViewModel()
    
    var body: some View {
        
        VStack {
            
            VStack {
                
                content
            }
            .padding(Constants.padding)
        }
        .appBackground()
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
        
        // TODO
        tripsView
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
        
        ScrollView {
            
            ForEach(viewModel.trips) { trip in
                
                TripCardView(trip: trip)
            }
        }
    }
}

#Preview {
    TripListView()
}
