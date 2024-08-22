//
//  LaunchScreenView.swift
//  coreML-starter
//
//
//

import SwiftUI

struct LaunchScreenView: View {
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                
                // title
                Text("PROTECH")
                    .font(Font.custom("CormorantGaramond-Bold", size: 75)).padding(.top, 30)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 20)
                    
                
                // header image:
                Image("campus")
                    .resizable().aspectRatio(contentMode: .fit)
                

                // classification button
                NavigationLink(destination: ClassificationView()){
                    Text("Start")
                }
                .buttonStyle(RoundedRectButtonStyle(buttonColor: Color(red: 0.13, green: 0.46, blue: 0.58)))
                .padding()
                
                
                
                // resources page
                NavigationLink(destination: ResourcesView()){
                    Text("Resources")
                }
                .buttonStyle(RoundedRectButtonStyle(buttonColor: Color(red: 0.13, green: 0.46, blue: 0.58)))
                .padding()
                
            }
            .frame(maxWidth: 600)
            .background(Color.white)
            .cornerRadius(25)
            .shadow(radius: 5)
            
        }// VStack
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.93, green: 0.95, blue: 0.95))
        .edgesIgnoringSafeArea(.all)
        .navigationBarHidden(true)
        
    }
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            if #available(iOS 15.0, *) {
                LaunchScreenView()
                    .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch)"))
                    .previewInterfaceOrientation(.landscapeLeft)
            } else {
                // Fallback on earlier versions
            }
        }
    }
}
