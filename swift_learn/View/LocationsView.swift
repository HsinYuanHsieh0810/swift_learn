//
//  LocationsView.swift
//  swift_learn
//
//  Created by HsinYuan on 2023/11/8.
//

import SwiftUI

class LocationsViewModel: ObservableObject {// ObservableObject, view可以隨時觀察變化
    
    /*
     需要搭配 @Published 標記才會發送更改通知
     */
    @Published var locations: [Location]
    
    init(){
        let locations = LocationsDataService.locations
        self.locations = locations
    }
    
}


struct LocationsView: View {
    // @StateObject private var vm  = LocationsViewModel() -->沒有放在環境中
    @EnvironmentObject private var vm: LocationsViewModel// 在環境中尋找LocationsViewModel實例
    
    var body: some View {
        List {
            ForEach(vm.locations) {
                Text($0.name)// 遍歷每個對象的name屬性
            }
        }
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}
