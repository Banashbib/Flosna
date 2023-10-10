//
//  Registeration .swift
//  Flosna
//
//  Created by Bana Alshabib on 25/03/1445 AH.
//

import SwiftUI

struct Registeration: View {
    @State private var phoneNumber: String = ""
    @State private var verificationCode: String = ""
    let fcolor = Color(red:0.486, green: 0.729, blue: 0.588)
    
    var body: some View {
        VStack  {
            //Spacer()
            HStack{
                Spacer()
                Text("التسجيل")
                    .font(.largeTitle)
                    .padding(.bottom,1)
                
                
                //Spacer()
            }
            .padding(.top,10)
            .padding(.horizontal,30)
            
            Divider()
                .padding(.horizontal,20)
            //Spacer()
                .padding()
            TextField("رقم الهاتف", text: $phoneNumber)
                .padding()
                .keyboardType(.numberPad)
                .background(Color.white)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(fcolor, lineWidth: 1)
                )
               .padding(.horizontal,20)
            
            TextField("رمز التحقق", text: $verificationCode)
                .padding()
                .keyboardType(.numberPad)
                .background(Color.white)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(fcolor, lineWidth: 1)
                )
            
            .padding(.horizontal,20)
            Spacer()
            HStack{
                
                
                
                //Spacer()
                
                Button(action: {
                    cancel()
                }) {
                    Text("لاحقًا")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .padding()
                        .frame(maxWidth: .infinity)
                    //.background(Color.green)
                        .cornerRadius(10)
                        .background(Color.white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                }
                .padding()
                
                Button(action: {
                    register()
                }) {
                    Text("تسجيل")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(fcolor)
                        .cornerRadius(10)
                }
                .padding()
                
                
            }
            .padding(.horizontal,2)
            Spacer()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        
    }
    
    private func register() {
        // Perform registration logic here
        // You can use the phoneNumber and verificationCode variables
        // to send the data to a server or perform any other necessary actions
        print("Registered with phone number: \(phoneNumber)")
        print("Verification code: \(verificationCode)")
    }
    private func cancel() {
        // Perform registration logic here
        // You can use the phoneNumber and verificationCode variables
        // to send the data to a server or perform any other necessary actions
        print("Registered Canceled")
        
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        Registeration()
    }
}


