//
//  ClassificationView.swift
//  coreML-starter
//
//  
//

import SwiftUI

struct ClassificationView: View {
    @EnvironmentObject var predictionStatus: PredictionStatus
    @StateObject var classifierViewModel = ClassifierViewModel()
    @State private var showAbout = false
    
    var body: some View {
        let predictionLabel = predictionStatus.topLabel
        
        GeometryReader { geo in
            HStack(alignment: .top) {
                LiveCameraRepresentable() {
                    predictionStatus.setLivePrediction(with: $0, label: $1, confidence: $2)
                }
                
                //            PredictionResultView(labelData: classifierViewModel.getPredictionData(label: predictionLabel))
                
                RightPredictionResultPanelView(labelData: classifierViewModel.getPredictionData(label: predictionLabel))
                
                
                NavigationLink(destination: AboutView(), isActive: $showAbout) {
                    EmptyView()
                }
                
            }// HStack
            .onAppear(perform: classifierViewModel.loadJSON)
            .frame(width: geo.size.width)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button( action: {
                        self.showAbout = true
                    }) {
                        Text("About")
                    }
                }
            }
        }
    }
}

struct ClassificationView_Previews: PreviewProvider {
    static var previews: some View {
        ClassificationView()
    }
}
