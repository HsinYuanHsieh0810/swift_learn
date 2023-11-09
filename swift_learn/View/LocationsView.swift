//
//  LocationsView.swift
//  swift_learn
//
//  Created by HsinYuan on 2023/11/8.
//

import SwiftUI


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
