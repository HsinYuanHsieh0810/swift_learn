//
//  swift_learnApp.swift
//  swift_learn
//
//  Created by HsinYuan on 2023/11/8.
//

import SwiftUI

@main
struct swift_learnApp: App {
    
    // @StateObject: LocationViewModel()有變化時，會重新渲染顯示
    @StateObject private var vm  = LocationsViewModel()// LocationsViewModel初始化
      
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
