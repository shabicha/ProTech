
//
//  ClassificationControllers.swift
//  ClassificationController
//
//  Created by Tiffany Tseng on 7/22/21.
//

import Foundation
import CoreML
import Vision
import UIKit
import SwiftUI

class ClassificationController: ObservableObject {
    
    private var model: MLModel? // the generated model
    private var visionModel: VNCoreMLModel? // vision model
    private var predictionStatus: PredictionStatus?
    private var imageToClassify: UIImage? = UIImage()
    private var classifyAsync = true
    
    @Published private(set) var prediction = ""
    @Published private(set) var predictionLabel = ""
    @Published private(set) var fullPrediction: [String: Float] = [:]
    
    func setPredictionStatus(input: PredictionStatus){
        self.predictionStatus = input
    }
    
    func createVNModel(modelUrl: URL) {
        //  load model
//        print("try to load model from \(modelUrl)")
//        let compiledModelUrl = try! MLModel.compileModel(at: modelUrl)
//        let model = try! MLModel(contentsOf: compiledModelUrl)
        self.visionModel = try? VNCoreMLModel(for: (predictionStatus?.modelObject.model)!)
        print("loaded model!")
    }
    
    func classify(image: UIImage, classifyAsync: Bool = true){
        // Set classifyAsync to false when we need the function to run synchronously
        // otherwise, leave as default to (espicially if there is a promise request)
        self.imageToClassify = image
        self.classifyAsync = classifyAsync
        guard let ciImage = CIImage(image: image) else {
            print("Unable to create CIImage")
            return
        }
        if classifyAsync {
            DispatchQueue.global(qos: .userInitiated).async{
                self.classifyHelper(ciImage: ciImage)
            }
        } else {
                self.classifyHelper(ciImage: ciImage)
    }
    }
    
    func classifyHelper(ciImage: CIImage) {
        let handler = VNImageRequestHandler(ciImage: ciImage)
        do {
            try handler.perform([self.classificationRequest])
            
        } catch {
            print("Failed to perform classification: \(error)")
        }
    }
    
    lazy var classificationRequest: VNCoreMLRequest = {
        do {
            print("start classification request with \(String(describing: self.visionModel))")
            let request = VNCoreMLRequest(model: self.visionModel!, completionHandler: { [weak self] request, error in
                print("Request is finished!", request.results!)
                guard let image = self?.imageToClassify else { return }
                self?.processObservations(for: request, image: image, error: error)
            })
            request.imageCropAndScaleOption = .centerCrop
            return request
        }
    }()
    
    func processObservationsHelper(for request: VNRequest, image: UIImage, error: Error?) {
        guard error == nil else {
            print("Observation error 🛑: \(error!.localizedDescription)")
            return
        }
        
        let results = request.results as? [VNClassificationObservation] ?? []
        let topResults = results.map { String(format: "%@: %.1f%%", $0.identifier, $0.confidence * 100) }
        
        self.fullPrediction = Dictionary(uniqueKeysWithValues: results.map { ($0.identifier, $0.confidence * 100) })
        let predictionLabel = results.prefix(1).map { observation in String(format: "%@", observation.identifier) }
        self.predictionLabel = predictionLabel[0]
        self.prediction = topResults.joined(separator: "\n")
        
        guard let predictionStatus = self.predictionStatus else { return }
        predictionStatus.setPrediction(result: self.prediction)
        predictionStatus.setPredictionLabel(label: self.predictionLabel)
        predictionStatus.setFullPrediction(fullPrediction: self.fullPrediction)
    }
    
    func processObservations(for request: VNRequest, image: UIImage, error: Error?) {
        if self.classifyAsync {
            DispatchQueue.main.async {
                self.processObservationsHelper(for: request, image: image, error: error)
            }
        } else {
                self.processObservationsHelper(for: request, image: image, error: error)
        }
        }
}
