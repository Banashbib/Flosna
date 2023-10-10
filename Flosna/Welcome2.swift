//
//  Welcome2.swift
//  Flosna
//
//  Created by Bana Alshabib on 25/03/1445 AH.
//

import SwiftUI

struct Welcome2: View {
    var body: some View {
        ZStack (alignment: .topTrailing){
            Image("welcome page 2")
                .resizable()
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            Button(action: {
                            
                            print("Skip button tapped")
                        }) {
                            Text("تخطي")
                                .font(.headline)
                                .padding(10)
                                //.background(Color.gray)
                                .foregroundColor(.gray)
                                .cornerRadius(8)
                                .padding(.trailing, 20)
                                .padding(.top, 3)
                        }

            
            
        }
    }
}

#Preview {
    welcom1()
}
