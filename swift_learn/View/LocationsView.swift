//
//  LocationsView.swift
//  swift_learn
//
//  Created by HsinYuan on 2023/11/8.
//

import SwiftUI
import MapKit



struct LocationsView: View {
    // @StateObject private var vm  = LocationsViewModel() -->沒有放在環境中
    @EnvironmentObject private var vm: LocationsViewModel// 在環境中尋找LocationsViewModel實例
    
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $vm.mapRegion)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                header
                    .padding()
                Spacer()
            }
        }
        
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}

extension LocationsView {
    private var header: some View {
        VStack {
            Button(action: vm.toogleLocationsList){
                Text(vm.maplocation.name + ", " + vm.maplocation.cityName)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .animation(.none, value: vm.maplocation) // 如果vm.maplocation變化，那就不會有動畫
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundColor(.primary)
                            .padding()
                            .rotationEffect(Angle(degrees: vm.showLocationsList ? 180 : 0))
                    }
            }
    
            if vm.showLocationsList {
                LocationsListView()
            }
            

        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
    }
}
