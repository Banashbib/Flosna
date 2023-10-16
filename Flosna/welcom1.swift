//
//  welcom1.swift
//  Flosna
//
//  Created by Bana Alshabib on 24/03/1445 AH.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationView{
            ZStack (alignment: .topTrailing){
                TabView {
                    WelcomePage(imageName: "welcome page 1")
                    WelcomePage(imageName: "WP2")
                    WelcomePage(imageName: "welcome page 3")
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                
                Button(action: {
                    
                    print("Skip button tapped")
                })
                {
                    
                    
                    NavigationLink(destination: Registeration().navigationBarBackButtonHidden(true)) {
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
    }
}
struct WelcomePage: View {
    var imageName: String
    
    var body: some View {
        GeometryReader { geometry in
            Image(imageName)
                //.resizable()
                //.scaledToFit()
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .frame(width: geometry.size.width, height: geometry.size.height)
        }
      
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}

