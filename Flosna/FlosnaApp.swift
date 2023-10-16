//
//  FlosnaApp.swift
//  Flosna
//
//  Created by Bana Alshabib on 20/03/1445 AH.
//

import SwiftUI
import SwiftUICharts
import SDWebImageSwiftUI

@main
struct FlosnaApp: App {
    var body: some Scene {
        WindowGroup {

            SplashPage()
            //ContentView()
                .environment(\.locale, Locale(identifier: "ar"))
                .environment(\.layoutDirection, .rightToLeft)

        }
    }
}
