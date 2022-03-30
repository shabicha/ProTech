//
//  ContentView.swift
//  co-ml-starter
//
//  Created by Tiffany Tseng on 3/22/22.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    
    @EnvironmentObject var predictionStatus: PredictionStatus
    @StateObject var classifierViewModel = ClassifierViewModel()
    
    var body: some View {
        let predictionLabel = predictionStatus.topLabel
        // let predictionConfidence = predictionStatus.topConfidence 
        
        ZStack(alignment: .topLeading) {
            LiveCameraRepresentable() {
                predictionStatus.setLivePrediction(with: $0, label: $1, confidence: $2)
            }
            PredictionResultView(labelData: classifierViewModel.getPredictionData(label: predictionLabel))

        }// ZStack
        .onAppear(perform: classifierViewModel.loadJSON)
    }// body
}// View
