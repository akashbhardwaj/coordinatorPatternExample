//
//  OnboardingView.swift
//  CoordinatorExample
//
//  Created by Akash Bhardwaj on 13/02/23.
//

import SwiftUI

struct OnboardingView: View {
    var doneClicked: ()  -> Void
    var body: some View {
        TabView {
            ScaledImageView(image: "football")
                .tag(0)
            ScaledImageView(image: "flower")
                .tag(1)
            ScaledImageView(image: "sun")
                .tag(2)
            Button (action: {
                doneClicked()
            }) {
                Text("Done")
            }
            .foregroundColor(.black)

        }
        .tabViewStyle(PageTabViewStyle())
        .background(Color.blue)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(doneClicked: {})
    }
}

struct ScaledImageView: View {
    var image: String
    var body: some View {
        Image(systemName: image)
            .resizable()
            .scaledToFit()
            .tag(0)
    }
}
