//
//  PredictionResultView.swift
//  coreML-starter
//
//  
//

import SwiftUI

struct PredictionResultView: View {
    private(set) var labelData: Classification
    
    var body: some View {
        // TODO: The View that shows classification results - edit the styling below!
        
        HStack(alignment: .top) {
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
                .padding(.init(top: 3, leading: 0, bottom: 5, trailing: 5))
                
                Text(labelData.water.description + (labelData.water > 1 ? " gallons" : " gallon"))
                    .font(.subheadline)
            }
            .padding(5)
            
            
        }// HStack
        .background(Color.white)
        .cornerRadius(20)
        .padding(15)
        .shadow(radius: 5)
    }
}

struct PredictionResultView_Previews: PreviewProvider {
    static var previews: some View {
        PredictionResultView(labelData: Classification(label: "Unicorn", water: 1, emoji: "🦄"))
    }
}
