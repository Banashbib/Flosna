//
//  Leen.swift
//  Flosna
//
//  Created by Leen Almejarri on 24/03/1445 AH.
//
import SwiftUI
import Foundation

struct الملفالشخصي: View {
    @State var tog : Bool = false
    @State private var showLogoutAlert = false
    @State private var showDeleteAccountAlert = false
    var body: some View {
        VStack{
            NavigationView {
                
                VStack (spacing:30){
                    
                    Divider()
                       
                    Image("sara").resizable().frame(width:150 , height:150).cornerRadius(400)
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
                                
                            // end Zstack اللغة
                        }
                        //Vstack cont.
                        ZStack{
                            Rectangle()
                                .fill(Color.ourgray).frame(width: 346.0, height: 54.8)
                                .cornerRadius(9)
                            
                            
                            Text("الاسئلة الشائعة")
                                .font(.title)
                            //end Zstack
                                
                        }
                        
                        //Vstack cont. تسجيل خروج
                        
                        HStack{
                            
                            VStack {
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
                
                
            }
            .padding()
        }}}

          
            

#Preview {
    الملفالشخصي()
}
