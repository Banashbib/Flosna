//
//  splash page.swift
//  Flosna
// https://media.giphy.com/media/QHhjlEgap1dn0tmMta/giphy.gif
//  Created by Rahaf on 12/10/2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct SplashPage: View {
    @State private var showSplash = true
    
    var body: some View {
        Group {
            if showSplash {
                WebImage(url: URL(string: "https://media.giphy.com/media/QHhjlEgap1dn0tmMta/giphy.gif"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                            showSplash = false
                        }
                    }
            } else {
                // Show your main view here
                Text("Wlc page")
            }
        }
    }
}

struct SplashPage_Previews: PreviewProvider {
    static var previews: some View {
        SplashPage()
    }
}

