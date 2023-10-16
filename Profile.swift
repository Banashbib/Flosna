//
//  Profile.swift
//  Flosna
//
//  Created by Bana Alshabib on 30/03/1445 AH.
//

import SwiftUI
import Foundation

struct Profile: View {
    @State var tog : Bool = false
    @State private var showLogoutAlert = false
    @State private var showDeleteAccountAlert = false
    var body: some View {
        VStack{
            NavigationView {
                
                VStack{
//                    Divider()
//                                                                .padding(.horizontal,9)
//
                   // Spacer()

                    Image("sara").resizable().frame(width:150 , height:150).cornerRadius(400)
                        .padding()
                   
                    VStack{
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
                            
                                //.padding()
                            Text("اللغة")
                                .font(.title)

                                .multilineTextAlignment(.trailing)
                                .padding(.trailing, 220.0)
                                

                                .padding()
                                
                            // end Zstack اللغة
                        }
                        
                        //Vstack cont.
                        ZStack{
                            Rectangle()
                                .fill(Color.ourgray).frame(width: 346.0, height: 54.8)
                                .cornerRadius(9)
                            
                            NavigationLink(destination: Questions().navigationBarBackButtonHidden(false)) {
                                Text("الاسئلة الشائعة")
                                    .font(.title)
                                    .foregroundColor(Color.black)
                                    .padding(.trailing, 120.0
                                    )
                                //end Zstack
                            }
                        }
                        
                        //Vstack cont. تسجيل خروج
                        
                        HStack(spacing:20){
                            
                            
                                
                                Button(action: {
                                    showLogoutAlert = true
                                }) {
                                    Text("تسجيل الخروج")
                                        .foregroundColor(.white)
                                        .font(.headline)
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .background(Color.ourgreen)
                                        .cornerRadius(10)
                                }
                                .alert(isPresented: $showLogoutAlert) {
                                    Alert(
                                        title: Text("تأكيد تسجيل الخروج"),
                                        message: Text("هل أنت متأكد من رغبتك في تسجيل الخروج؟"),
                                        primaryButton: .cancel(Text("إلغاء")),
                                        secondaryButton: .destructive(Text("تسجيل الخروج"), action: {
                                            // تنفيذ الإجراء المرتبط بتسجيل الخروج هنا
                                        })
                                    )
                                    
                                }
                                
                                
                                
                            
                            Button(action: {
                                showDeleteAccountAlert = true
                            }) {
                                Text("حذف الحساب")
                                    .foregroundColor(Color.ourgreen)
                                    .font(.headline)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10).stroke(Color.ourgreen , lineWidth:1))
                            }
                            .alert(isPresented: $showDeleteAccountAlert) {
                                Alert(
                                    title: Text("تأكيد حذف الحساب"),
                                    message: Text("هل أنت متأكد من رغبتك في حذف الحساب؟"),
                                    primaryButton: .cancel(Text("إلغاء")),
                                    secondaryButton: .destructive(Text("حذف الحساب"), action: {
                                        // تنفيذ الإجراء المرتبط بحذف الحساب هنا
                                    })
                                )
                            }

                        }
                        
                        

                        
                    }
                    

                }

                    .navigationBarTitle("الملف الشخصي")
                    .environment(\.layoutDirection, .rightToLeft)
                    .padding()
                
            }
            .environment(\.layoutDirection, .rightToLeft)
            .padding()
            .padding()
            .environment(\.locale, Locale(identifier: "ar"))
            .environment(\.layoutDirection, .rightToLeft)
        }}}

          
    

#Preview {
    Profile()
}
