//
//  ReportView.swift
//  coreML-starter
//
//  Created by JESSI on 8/6/23.
//

import SwiftUI

struct ReportView: View {
    var body: some View {
        
        VStack(alignment: .leading, spacing: 53) {
            //start of header
                   ZStack {
                       
                   Rectangle()
                     .foregroundColor(.clear)
                     .frame(width: 885.45325, height: 372.6842)
                     .background(
                       Image("PATH_TO_IMAGE")
                         .resizable()
                         .aspectRatio(contentMode: .fill)
                         .frame(width: 885.4532470703125, height: 372.6842041015625)
                         .clipped()
                     )
                   Rectangle()
                     .foregroundColor(.clear)
                     .frame(width: 841, height: 97)
                   
                   HStack(alignment: .top, spacing: 350) {
                   HStack(alignment: .center, spacing: 10) {
                   Text("Safe")
                     .font(Font.custom("Helvetica Neue", size: 18))
                     .kerning(0.72)
                     .multilineTextAlignment(.center)
                     .foregroundColor(Color(red: 0.04, green: 0.29, blue: 0))
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
                   .padding(0)
                   }
                   .padding(0)
                    }
                   .frame(width: 843, height: 97)
                  
               Divider()
               //end of header

        VStack(alignment: .leading, spacing: 38) {
        Text("Community reports")
          .font(Font.custom("Helvetica Neue", size: 24))
          .multilineTextAlignment(.center)
          .foregroundColor(Color(red: 0.05, green: 0.1, blue: 0.12))

        HStack(alignment: .top, spacing: 88) {
        VStack(alignment: .leading, spacing: 20) {
        Rectangle()
          .foregroundColor(.clear)
          .frame(width: 272.75674, height: 326)
          .background(
            Image("statue")
              .resizable()
              .aspectRatio(contentMode: .fill)
              .frame(width: 272.7567443847656, height: 326)
              .clipped()
          )

        VStack(alignment: .trailing, spacing: 5) {
        HStack(alignment: .center, spacing: 18) {
        Image("User Circle")
        .frame(width: 37, height: 37)
        Text("Unsafe at night!!")
          .font(Font.custom("Helvetica Neue", size: 20))
          .kerning(0.8)
          .multilineTextAlignment(.center)
          .foregroundColor(Color(red: 0.05, green: 0.1, blue: 0.12))

         }
        .padding(0)
        Text("I was catcalled here.")
          .font(Font.custom("Helvetica Neue", size: 16))
          .kerning(0.64)
          .multilineTextAlignment(.center)
          .foregroundColor(Color(red: 0.05, green: 0.1, blue: 0.12))

        }
        .padding(.leading, 12)
        .padding(.trailing, 0)
        .padding(.vertical, 0)

        }
        .padding(.horizontal, 0)
        .padding(.top, 0)
        .padding(.bottom, 28)
        .cornerRadius(12)
        .overlay(
          RoundedRectangle(cornerRadius: 12)
            .inset(by: 0.5)
            .stroke(Color(red: 0.77, green: 0.77, blue: 0.79), lineWidth: 1)
        )

         }

        }
        .padding(.horizontal, 42)
        .padding(.vertical, 0)
        Spacer()

         }

    }
}

struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        ReportView()
    }
}
