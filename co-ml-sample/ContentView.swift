//
//  ContentView.swift
//  co-ml-sample
//
//  Created by Tiffany Tseng on 3/22/22.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    
    @EnvironmentObject var predictionStatus: PredictionStatus
    @ObservedObject var classificationController = ClassificationController()
    
    var body: some View {
        ZStack {
            LiveCameraRepresentable(modelURL: predictionStatus.modelUrl) {
                predictionStatus.setLivePrediction(with: $0, label: $1, confidence: $2)
            }
            // TODO: Handle styling of classification results here
            VStack {
                HStack {
                    Text("\(predictionStatus.topLabel): \(predictionStatus.topConfidence)")
                }
                
                // display full result
//                Text(predictionStatus.livePrediction.description)
                
                // Display model information
//                Text("Model Info: \(predictionStatus.modelObject.model.description)")
            }// vstack
            .background(Color.white)
            .foregroundColor(.black)
            .padding(10)
        }
        
    }
}
