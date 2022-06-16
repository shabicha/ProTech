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
                    if(labelData.water > 0) {
                        ForEach(0...labelData.water-1, id: \.self) { index in
                            Text("💧")
                        }
                    }
                }
                .padding(.init(top: 3, leading: 0, bottom: 5, trailing: 5))
                
                HStack {
                    Text(labelData.water.description + " ")
                    if (labelData.water > 1) {
                        Text("gallons")
                    } else {
                        Text("gallon")
                    }
                }
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
        PredictionResultView(labelData: Classification())
    }
}
