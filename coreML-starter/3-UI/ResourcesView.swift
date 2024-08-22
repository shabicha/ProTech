//
//  ResourcesView.swift
//  coreML-starter
//
//  Created by JESSI on 8/6/23.
//

import SwiftUI
import AVFoundation

var audioPlayer : AVAudioPlayer?

struct ResourcesView: View {
    
    @Environment(\.openURL) var openURL
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .padding(.all, 120.0)
                .cornerRadius(120)
                .foregroundColor(Color(red: 0.93, green: 0.95, blue: 0.95))
            
            VStack(spacing:80) {
                
                Text("TOOLS").font(.custom("CormorantGaramond-Bold", size: 65))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 130)
                    .padding(.top, 30)
                    
                // call authorities btn
                HStack {
                    Button() {
                        
                        if let phoneCallURL = URL(string: "tel://\(911)") {
                            
                            let application:UIApplication = UIApplication.shared
                            if (application.canOpenURL(phoneCallURL)) {
                                application.open(phoneCallURL, options: [:], completionHandler: nil)
                            }
                        }
                        
                    }label: {
                        Image(systemName: "phone").resizable().frame(width:30, height:30)
                            .foregroundColor(.white)
                        Text("Call authorities")
                            .font(.title)
                            .padding(.horizontal, 20)
                            .foregroundColor(.white)
                    }     .padding()
                        .background(Color.red)
                        .cornerRadius(10)
                    
                    // Self-defense resources btn
                    Button() {
                        openURL(URL(string: "https://lifehacker.com/basic-self-defense-moves-anyone-can-do-and-everyone-sh-5825528")!)
                    }label: {
                        Image(systemName: "bolt.heart")
                            .resizable()
                            .frame(width:30, height:30)
                            .foregroundColor(.white)
                        Text("Self-defense resources")
                            .font(.title)
                            .padding(.horizontal, 20)
                            .foregroundColor(.white)
                    }.padding()
                        .background(Color.red)
                        .cornerRadius(10)
                }
                
                HStack {
                    
                    // fake phone call btn
                    Button() {
                        playSound(urlName: "phone call")
                    }label: {
                        Image(systemName: "waveform")
                            .resizable()
                            .frame(width:30, height:30)
                            .foregroundColor(.white)
                        Text("Phone call audio")
                            .font(.title)
                            .padding(.horizontal, 20)
                            .foregroundColor(.white)
                    }.padding()
                        .background(Color.red)
                        .cornerRadius(10)
                    
                    // safety alarm btn
                    Button() {
                        playSound(urlName: "alarm")
                    }label: {
                        Image(systemName: "speaker.wave.2").resizable().frame(width:30, height:30)
                            .foregroundColor(.white)
                        Text("Safety Alarm")
                            .font(.title)
                            .padding(.horizontal, 20)
                            .foregroundColor(.white)
                    }.padding()
                        .background(Color.red)
                        .cornerRadius(10)
                }
                
                
                Image("logo")
                    .resizable()
                    .frame(width:200, height:200, alignment: .trailing)
                    .padding(.leading, 800)
                    .padding(.bottom, 50)
            }
    
            
            
        }.padding()
            .aspectRatio(contentMode: .fit)
    }
    
    // play sound function
    func playSound(urlName : String) {
       let resourcePath = Bundle.main.url(forResource: "\(urlName)", withExtension: "mp3")
       
       do{
                 //initializing the audio player with the resource path
                 audioPlayer = try AVAudioPlayer(contentsOf: resourcePath!)
                 
                 //play the audio
                 audioPlayer?.play()
                //stop the audio
               // audioPlayer?.stop()
                
          
             }
             catch{
               //error handling
                 print(error.localizedDescription)
             }
       
       
       
   }
    
    
    
    
    
    
    
}

struct ResourcesView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            if #available(iOS 15.0, *) {
                ResourcesView()
                    .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch)"))
                    .previewInterfaceOrientation(.landscapeLeft)
            } else {
                // Fallback on earlier versions
            }
        }
    }
}

