//
//  Leen.swift
//  Flosna
//
//  Created by Leen Almejarri on 24/03/1445 AH.
//
import SwiftUI
import Foundation

struct Leen: View {
    @State var tog : Bool = false
    var body: some View {
        VStack{
        NavigationView {
            
            VStack{
                    Divider()
                        .padding()
                    Image("sara").resizable().frame(width: /*@START_MENU_TOKEN@*/200.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/200.0/*@END_MENU_TOKEN@*/).cornerRadius(400)
                        .padding()
                    VStack(){
                        ZStack{
                          Rectangle()
                                .fill(Color.ourgray).frame(width: 346.0, height: 54.8)
                                .cornerRadius(9)
                            
                            Toggle(isOn: $tog ) {
                                Text("التنبيهات")
                                    .font(.title)
                            }
                            .padding(.horizontal,30)
                            // end Zstack تنبيهات
                        }
                        //Vstack cont.
                        ZStack{
                            Rectangle()
                                  .fill(Color.ourgray).frame(width: 346.0, height: 54.8)
                                  .cornerRadius(9)
                              
                            .padding()
                            Text("اللغة")
                                .font(.title)
                                .multilineTextAlignment(.trailing)
                                .padding(.leading, 250)
                            // end Zstack اللغة
                        }
                        //Vstack cont.
                        ZStack{
                            Rectangle()
                                  .fill(Color.ourgray).frame(width: 346.0, height: 54.8)
                                  .cornerRadius(9)
                              
                            
                            Text("الاسئلة الشائعة")
                                .font(.title)
                                .multilineTextAlignment(.trailing)
                                .padding(.leading, 180)
                        } //end Zstack الاسئلة الشائعة
                        
                }
                    Spacer()
                         .navigationBarTitle("الملف الشخصي")

            
            }
        }}
            .padding()
        
    }}
#Preview {
    Leen()
}
