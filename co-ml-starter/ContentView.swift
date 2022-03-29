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
        let predictionConfidence = predictionStatus.topConfidence
        
        ZStack(alignment: .topLeading) {
            LiveCameraRepresentable() {
                predictionStatus.setLivePrediction(with: $0, label: $1, confidence: $2)
            }
            // TODO: The View that shows classification results - edit the styling below!
            HStack(alignment: .top) {
                if let labelData = classifierViewModel.classifierData.filter { $0.label == predictionLabel }.first {
                    Text(labelData.emoji)
                        .font(.system(size: 100))
                        .padding(.bottom, 5)
                    
                    VStack(alignment: .leading) {
                        Text(labelData.label.capitalized)
                            .font(.title)
                        
                        HStack(spacing: 1) {
                            ForEach(0...labelData.water-1, id: \.self) { index in
                                Text("💧")
                            }
                        }
                        .padding(.init(top: 5, leading: 0, bottom: 5, trailing: 5))
                        
                        Text(labelData.water.description + (labelData.water > 1 ? " gallons" : " gallon"))
                            .font(.subheadline)
                    }
                    .padding(5)
                }
                

            }// HStack
            .background(Color.white)
            .cornerRadius(20)
            .padding(15)
        }// ZStack
        .onAppear(perform: classifierViewModel.loadJSON)
    }// body
}// View
