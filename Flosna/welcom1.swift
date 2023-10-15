//
//  welcom1.swift
//  Flosna
//
//  Created by Bana Alshabib on 24/03/1445 AH.
//

import SwiftUI

struct welcom1: View {
    var body: some View {
        
            NavigationView{
                ZStack (alignment: .topTrailing){
                Image("welcome page 1")
                    .resizable()
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
               
                Button(action: {
                    
                    print("Skip button tapped")
                }) {
                    NavigationLink(destination: Welcome2()) {
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
           // Text("تخطي").font(.headline)
                       //.padding(10)
        }
    }
}

#Preview {
    welcom1()
}
