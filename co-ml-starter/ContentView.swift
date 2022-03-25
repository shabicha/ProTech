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
    
    var body: some View {
        let predictionLabel = predictionStatus.topLabel
        let predictionConfidence = predictionStatus.topConfidence
        
        ZStack(alignment: .topLeading) {
            LiveCameraRepresentable() {
                predictionStatus.setLivePrediction(with: $0, label: $1, confidence: $2)
            }
            // TODO: The View that shows classification results - edit the styling below!
            VStack {
                HStack {
                    Text("\(predictionLabel): \(predictionConfidence)")
                }
                
                // display full result
                //                Text(predictionStatus.livePrediction.description)
                
                // Display model information
                //                Text("Model Info: \(predictionStatus.modelObject.model.description)")
            }// VStack
            .background(Color.white)
            .cornerRadius(20)
            .padding(15)
        }// ZStack
    }// body
}// View
