//
//  AboutView.swift
//  coreML-starter
//
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack {
            Text("About the Creators")
                .font(.title)
            Text("Add some info about who created the app!")
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
