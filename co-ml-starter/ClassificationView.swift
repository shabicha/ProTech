//
//  ClassificationView.swift
//  co-ml-starter
//
//  Created by Tiffany Tseng on 4/15/22.
//

import SwiftUI

struct ClassificationView: View {
    @EnvironmentObject var predictionStatus: PredictionStatus
    @StateObject var classifierViewModel = ClassifierViewModel()
    
    var body: some View {
        let predictionLabel = predictionStatus.topLabel
        
        ZStack(alignment: .topLeading) {
            LiveCameraRepresentable() {
                predictionStatus.setLivePrediction(with: $0, label: $1, confidence: $2)
            }
            PredictionResultView(labelData: classifierViewModel.getPredictionData(label: predictionLabel))

        }// ZStack
        .onAppear(perform: classifierViewModel.loadJSON)
    }
}

struct ClassificationView_Previews: PreviewProvider {
    static var previews: some View {
        ClassificationView()
    }
}
