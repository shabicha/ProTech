//
//  ClassifierViewModel.swift
//  co-ml-starter
//
//  Created by Tiffany Tseng on 3/29/22.
//

import Foundation

final class ClassifierViewModel: ObservableObject {
    @Published var classifierData: [Classification] = []
    
    func loadJSON() {
        print("load JSON")
        if let url = Bundle.main.url(forResource: "mydata", withExtension: "json") {
            do {
                let jsonData = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                classifierData = try decoder.decode([Classification].self, from: jsonData)
            } catch {
                print(error)
            }
        } else {
            print("could not find data")
        }
    }
    
    func getPredictionData(label: String) -> Classification {
        let defaultClassification = Classification(label: "Unicorn", water: 1, emoji: "🦄")
        
        return classifierData.filter { $0.label == label }.first ?? defaultClassification
    }
}
