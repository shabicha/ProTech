//
//  PredictionResultView.swift
//  coreML-starter
//

import SwiftUI

struct PredictionResultView: View {
    @State private var showingAlert = false
    private(set) var labelData: Classification
    
    var body: some View {
        // TODO: The View that shows classification results - edit the styling below!
        
        VStack(alignment: .center) {
            Text(labelData.label.capitalized)
                .font(Font.custom("CormorantGaramond-Bold", size: 50))
            
            Image(labelData.imageName).resizable().aspectRatio(contentMode: .fit)
            
            
            NavigationLink(destination: ResultsPageView()){
                Text("info")
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
                    .font(.title)
            }
            .buttonStyle(RoundedRectButtonStyle(buttonColor: Color.red))
            .padding()
            



        }// VStack
        .frame(width: 400)
        .padding()
        
        
     
                
                
        
        
    }
}

struct PredictionResultView_Previews: PreviewProvider {
    static var previews: some View {
        PredictionResultView(labelData: Classification())
    }
}
