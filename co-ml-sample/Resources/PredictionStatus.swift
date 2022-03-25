//
//  TrainingStatus.swift
//  TrainingStatus
//
//  Created by Tiffany Tseng on 8/4/21.
//

import Foundation
import SwiftUI
import Vision

class PredictionStatus: ObservableObject {
    // TODO - replace with the name of your .mlmodel imported into the XCode Project
    @Published var modelObject = Produce()
    
    @Published var topLabel = ""
    @Published var topConfidence = ""
    
    // Live prediction results
    @Published var livePrediction: LivePredictionResults = [:]
    
    func setTopLabel(label: String){
        self.topLabel = label
    }
    func setTopConfidence(confidence: String){
        self.topConfidence = confidence
    }
    func setLivePrediction(with results: LivePredictionResults, label: String, confidence: String) {
        livePrediction = results
        topLabel = label
        topConfidence = confidence
    }
}
