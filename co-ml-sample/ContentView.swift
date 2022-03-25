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
    var classifierData: [ClassifierData] = []
    
    init(){
        if let url = Bundle.main.url(forResource: "mydata", withExtension: "json") {
            do {
                let jsonData = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                classifierData = try decoder.decode([ClassifierData].self, from: jsonData)
                print("classifierData: ", classifierData)
            } catch {
                print(error)
            }
        } else {
            print("could not find data")
        }
    }
    
    var body: some View {
        let predictionLabel = predictionStatus.topLabel
        let predictionConfidence = predictionStatus.topConfidence
        
        ZStack(alignment: .topLeading) {
            // The live camera view
            LiveCameraRepresentable() {
                predictionStatus.setLivePrediction(with: $0, label: $1, confidence: $2)
            }
            
            // TODO: The view that shows classification results - edit the styling below!
            HStack(alignment: .top) {
                if let labelData = classifierData.filter { $0.label == predictionLabel }.first {
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
            
        }// zstack
    }// body
}// View
