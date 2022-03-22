//
//  co_ml_sampleApp.swift
//  co-ml-sample
//
//  Created by Tiffany Tseng on 3/22/22.
//

import SwiftUI

@main
struct co_ml_sampleApp: App {
    
    @StateObject private var predictionStatus = PredictionStatus()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(predictionStatus)
        }
    }
}
