//
//  FlosnaApp.swift
//  Flosna
//
//  Created by Bana Alshabib on 20/03/1445 AH.
//

import SwiftUI

@main
struct FlosnaApp: App {
    var body: some Scene {
        WindowGroup {

          //  ContentView()

            plan()
                
                 .environment(\.layoutDirection, .rightToLeft)
              // .environment(\.layoutDirection, .rightToLeft)

//            Tasks()
//                .environment(\.locale, Locale(identifier: "ar"))
//                 .environment(\.layoutDirection, .rightToLeft)
//              // .environment(\.layoutDirection, .rightToLeft)


            ContentView()
                .environment(\.locale, Locale(identifier: "ar"))
                .environment(\.layoutDirection, .rightToLeft)

        }
    }
}
