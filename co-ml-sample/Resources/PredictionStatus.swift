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
    @Published var modelUrl = URL(fileURLWithPath: "")
    // TODO - replace PetClassifier with the name of your .mlmodel imported into the XCode Project
    
    @Published var modelObject =  PetClassifier()
    
    @Published var predictionLabel = ""
    @Published var prediction = ""
    
    @Published var topLabel = ""
    @Published var topConfidence = ""
    
    //  mapping of all of the labels and their confidence scores for an image
    @Published var fullPrediction: [String: Float] = [:]
    // Live prediction results
    @Published var livePrediction: LivePredictionResults = [:]
    // Live prediction results stored as a list of ValuePerCategory objects for easy graphing
    @Published var liveDataVPC: [ValuePerCategory] = []

    func setPrediction(result: String){
        self.prediction = result
    }
    
    func setPredictionLabel(label: String){
        self.predictionLabel = label
    }
    func setFullPrediction(fullPrediction: [String: Float]){
        self.fullPrediction = fullPrediction
    }
    func setTopLabel(label: String){
        self.topLabel = label
    }
    func setTopConfidence(confidence: String){
        self.topConfidence = confidence
    }
    func resetVars() {
        self.fullPrediction = [:]
        self.prediction = ""
        self.predictionLabel = ""
    }
    func setLivePrediction(with results: LivePredictionResults, label: String, confidence: String) {
        livePrediction = results
        topLabel = label
        topConfidence = confidence
    }
}
