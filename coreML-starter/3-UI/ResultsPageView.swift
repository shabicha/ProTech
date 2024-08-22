//
//  ResultsPageView.swift
//  coreML-starter
//
//  Created by JESSI on 8/6/23.
//

import SwiftUI

struct ResultsPageView: View {
    
    @State private var showingAlert = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 100) {
                //top vstack
                VStack(alignment: .leading, spacing: 50) {
                    VStack(alignment: .leading, spacing: 24) {
                        //start of header
                        ZStack {
                            
                            HStack(alignment: .top, spacing: 30) {
                                Text("")
                                HStack(alignment: .center, spacing: 10) {
                                    
                                    Button("Safe") {
                                        showingAlert = true
                                    }
                                    .foregroundColor(.black)
                                    .alert(isPresented: $showingAlert) {
                                        Alert(title: Text("Good. Stay alert and be aware of your surroundings!"), dismissButton: .default(Text("Got it!")))
                                    }
                                    
                                }
                                .padding(.horizontal, 45)
                                .padding(.vertical, 5)
                                .background(Color(red: 0.83, green: 0.94, blue: 0.85))
                                .cornerRadius(6)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 6)
                                        .inset(by: 0.5)
                                        .stroke(Color(red: 0.56, green: 0.83, blue: 0.51), lineWidth: 1)
                                )
                                Spacer()
                                //statue text
                                HStack(alignment: .center, spacing: 16) {
                                    Image("Map Point")
                                        .frame(width: 30, height: 30)
                                    Text("Richmond, VA")
                                        .font(Font.custom("Helvetica Neue", size: 20))
                                        .kerning(0.8)
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(Color(red: 0.05, green: 0.1, blue: 0.12))
                                    
                                }
                            }
                        }
                        .frame(width: 800, height: 97)
                        
                        Divider()
                        //end of header
                        //insert header1
                        VStack(alignment: .leading, spacing: 36) {
                            HStack(alignment: .top, spacing: 10) { Text("Emergency actions")
                                    .font(Font.custom("Helvetica Neue", size: 24))
                                    .multilineTextAlignment(.center)
                                .foregroundColor(.black)}
                            .padding(.horizontal, 42)
                            .padding(.vertical, 0)
                            HStack(alignment: .top, spacing: 42) {
                                //insert circle buttons
                                ZStack{
                                    Image("Ellipse 2")
                                        .frame(width: 100, height: 100)
                                    Image(systemName: "phone")
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                }
                                ZStack{
                                    Image("Ellipse 2")
                                        .frame(width: 100, height: 100)
                                    Image(systemName: "speaker.wave.2")
                                        .resizable()
                                        .frame(width: 40, height: 35)
                                }
                                ZStack{
                                    Image("Ellipse 2")
                                        .frame(width: 100, height: 100)
                                    Text("911")
                                        .font(
                                            Font.custom("Helvetica Neue", size: 35)
                                                .weight(.bold)
                                        )
                                        .multilineTextAlignment(.center)
                                    
                                    
                                }
                                
                            }
                            .padding(.leading, 42)
                            .padding(.trailing, 5)
                        }
                        
                    }
                    
                    VStack(alignment: .leading, spacing: 40) {
                        Text("Nearest shelter")
                            .font(Font.custom("Helvetica Neue", size: 24))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                        HStack(alignment: .top, spacing: 90) {
                            //insertcard1
                            VStack(alignment: .center, spacing: 28) {
                                //text-image
                                VStack(alignment: .leading, spacing: 16) {
                                    Rectangle()
                                        .foregroundColor(.clear)
                                        .frame(width: 310, height: 175)
                                        .background(
                                            Image("crunchfitness")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 310, height: 175)
                                                .clipped()
                                        )
                                    VStack(alignment: .leading, spacing: 12) {
                                        Text("Gym")
                                            .font(Font.custom("Helvetica Neue", size: 20))
                                            .kerning(0.8)
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(Color(red: 0.05, green: 0.1, blue: 0.12))
                                        VStack(alignment: .leading, spacing: 5) {
                                            Text("Closes soon ⋅ 5 p.m.")
                                                .font(Font.custom("Helvetica Neue", size: 16))
                                                .kerning(0.64)
                                                .multilineTextAlignment(.center)
                                                .foregroundColor(Color(red: 0.55, green: 0.27, blue: 0))
                                            HStack(alignment: .center, spacing: 7) {
                                                Image("Walking Round")
                                                    .frame(width: 21, height: 21)
                                                Text("5 mins")
                                                    .font(Font.custom("Helvetica Neue", size: 16))
                                                    .kerning(0.64)
                                                    .multilineTextAlignment(.center)
                                                    .foregroundColor(Color(red: 0.05, green: 0.1, blue: 0.12))
                                            }
                                            .padding(0)
                                        }
                                        .padding(0)
                                    }
                                    .padding(.horizontal, 27)
                                    .padding(.vertical, 0)
                                }
                                .padding(0)
                                //button
                                HStack(alignment: .center, spacing: 12) {
                                    Image("Route")
                                        .frame(width: 30, height: 30)
                                    Text("Directions")
                                        .font(Font.custom("Helvetica Neue", size: 16))
                                        .kerning(0.64)
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(.white)
                                }
                                .padding(.horizontal, 15)
                                .padding(.vertical, 6)
                                .frame(width: 241, alignment: .center)
                                .background(Color(red: 0.03, green: 0.4, blue: 0.53).opacity(0.9))
                                .cornerRadius(8)
                            }
                            .padding(.horizontal, 0)
                            .padding(.top, 0)
                            .padding(.bottom, 16)
                            .cornerRadius(12)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .inset(by: 0.5)
                                    .stroke(.black, lineWidth: 1)
                            )
                            VStack(alignment: .center, spacing: 28) {
                                //text-image
                                VStack(alignment: .leading, spacing: 16) {
                                    Rectangle()
                                        .foregroundColor(.clear)
                                        .frame(width: 310, height: 175)
                                        .background(
                                            Image("crunchfitness")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 310, height: 175)
                                                .clipped()
                                        )
                                    VStack(alignment: .leading, spacing: 12) {
                                        Text("Gym")
                                            .font(Font.custom("Helvetica Neue", size: 20))
                                            .kerning(0.8)
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(Color(red: 0.05, green: 0.1, blue: 0.12))
                                        VStack(alignment: .leading, spacing: 5) {
                                            Text("Closes soon ⋅ 5 p.m.")
                                                .font(Font.custom("Helvetica Neue", size: 16))
                                                .kerning(0.64)
                                                .multilineTextAlignment(.center)
                                                .foregroundColor(Color(red: 0.55, green: 0.27, blue: 0))
                                            HStack(alignment: .center, spacing: 7) {
                                                Image("Walking Round")
                                                    .frame(width: 21, height: 21)
                                                Text("5 mins")
                                                    .font(Font.custom("Helvetica Neue", size: 16))
                                                    .kerning(0.64)
                                                    .multilineTextAlignment(.center)
                                                    .foregroundColor(Color(red: 0.05, green: 0.1, blue: 0.12))
                                            }
                                            .padding(0)
                                        }
                                        .padding(0)
                                    }
                                    .padding(.horizontal, 27)
                                    .padding(.vertical, 0)
                                }
                                .padding(0)
                                //button
                                HStack(alignment: .center, spacing: 12) {
                                    Image("Route")
                                        .frame(width: 30, height: 30)
                                    Text("Directions")
                                        .font(Font.custom("Helvetica Neue", size: 16))
                                        .kerning(0.64)
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(.white)
                                }
                                .padding(.horizontal, 15)
                                .padding(.vertical, 6)
                                .frame(width: 241, alignment: .center)
                                .background(Color(red: 0.03, green: 0.4, blue: 0.53).opacity(0.9))
                                .cornerRadius(8)
                            }
                            .padding(.horizontal, 0)
                            .padding(.top, 0)
                            .padding(.bottom, 16)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .inset(by: 0.5)
                                    .stroke(.black, lineWidth: 1)
                            )
                            
                        }
                        .padding(0)
                        
                    }
                    .padding(.horizontal, 42)
                    .padding(.vertical, 0)
                    
                }
                .padding(0)
                
                //hstack w buttons
                HStack(alignment: .top, spacing: 46) {
                    HStack(alignment: .center, spacing: 12) {
                        Text("Report ")
                            .font(Font.custom("Arial", size: 26))
                        //.kerning(1.04)
                            .multilineTextAlignment(.center)
                            .padding()
                            .background(Color.red)
                            .cornerRadius(30)
                            .foregroundColor(.white)
                        
                    }
                    .padding(.horizontal, 32)
                    .padding(.vertical, 9)
                    .frame(width: 322, height: 59, alignment: .center)
                    .background(Color.red)
                    .cornerRadius(12)
                    //insert here
                    NavigationLink(destination: ReportView()) {
                        HStack(alignment: .center, spacing: 12) {
                        }
                        Text("View reports")
                            .font(Font.custom("Helvetica Neue", size: 26))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 0.05, green: 0.1, blue: 0.12))
                        
                    }
                    .padding(.horizontal, 32)
                    .padding(.vertical, 9)
                    .frame(width: 322, height: 59, alignment: .center)
                    .cornerRadius(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .inset(by: 1)
                            .stroke(Color.red, lineWidth: 2)
                    )
                }
                
            }
            .padding()
            .padding(.top, 30)
            
            
        }
        }
    }

struct ResultsPageView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            if #available(iOS 15.0, *) {
                ResultsPageView()
                    .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch)"))
                    .previewInterfaceOrientation(.landscapeLeft)
            } else {
                // Fallback on earlier versions
            }
        }
    }
}
