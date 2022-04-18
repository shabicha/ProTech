//
//  LaunchScreenView.swift
//  co-ml-starter
//
//  Created by Tiffany Tseng on 4/15/22.
//

import SwiftUI

struct LaunchScreenView: View {
    var body: some View {
        VStack {
            VStack {
                // header image: to replace, drag an image to assets.xcassets and add the name of your image
                Image("water-footprint")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
                
                // app title
                Text("Water Footprint")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                    .foregroundColor(.primary)
                
                Divider().frame(maxWidth: 300)
                
                // info - replace with info about your app!
                VStack(spacing: 20) {
                    Text("Discover how much water is needed to grow our food!")
                    
                    Text("This app uses the camera and AR (powered by ML) to show the environmental impact of different foods.")
                    
                    Text("Gather these ingredients to get started.")
                }
                .padding()
                .multilineTextAlignment(.center)
                
                // item list: replace with the names of your items
                HStack(spacing: 10) {
                    VStack {
                        Text("🍅")
                        Text("Tomato")
                    }
                    .padding()
                    
                    VStack {
                        Text("🍊")
                        Text("Orange")
                    }
                    .padding()
                    
                    VStack {
                        Text("🥦")
                        Text("Broccoli")
                    }
                    .padding()
                    
                    VStack {
                        Text("🍓")
                        Text("Strawberry")
                    }
                    .padding()
                }
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(10)
                .padding()
                
                // start button
                NavigationLink(destination: ClassificationView()){
                    Text("Start")
                }
                .buttonStyle(RoundedRectButtonStyle())
                .padding()
                
                // byline
                Text("Created by Tiffany Tseng")
                    .font(.caption)
                    .padding()
            }
            .padding()
            .frame(maxWidth: 500)
            .background(Color.white)
            .cornerRadius(25)
            .shadow(radius: 5)
            
        }// VStack
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hex: 0xD5F4FF, opacity: 1.0))
        .edgesIgnoringSafeArea(.all)
        .navigationBarHidden(true)
    }
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
    }
}
