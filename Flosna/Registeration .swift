//
//  Registeration .swift
//  Flosna
//
//  Created by Bana Alshabib on 25/03/1445 AH.
//

import SwiftUI
//import LocalAuthentication

struct Registeration: View {
    // @State private var isUnlocked = false
    @State private var phoneNumber: String = ""
    @State private var verificationCode: String = ""
    
    @State private var digit1: String = ""
    @State private var digit2: String = ""
    @State private var digit3: String = ""
    @State private var digit4: String = ""
    
    let fcolor = Color(red:0.486, green: 0.729, blue: 0.588)
    
    var body: some View {
        VStack  {
            //Spacer()
           // NavigationView {
            HStack{
                
                    //Spacer()
                    Text("التسجيل")
                        .font(.largeTitle)
                        .bold()
                        .padding(.bottom,1)
                    
                    
                    Spacer()
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
                
            
            VStack {
                Text("ادخل رمز التحقق")
                    .font(.headline)
                    .foregroundColor(Color.gray)
                    .padding()
                
                HStack(spacing: 16) {
                    DigitTextField(tag: 1, text: $digit1)
                    DigitTextField(tag: 2, text: $digit2)
                    DigitTextField(tag: 3, text: $digit3)
                    DigitTextField(tag: 4, text: $digit4)
                }
                .padding()
                
                Button("") {
                    let verificationCode = digit1 + digit2 + digit3 + digit4
                    
                    // Perform verification logic here
                    if verificationCode == "1234" {
                        // Verification code is correct
                        print("Verification Successful")
                    } else {
                        // Verification code is incorrect
                        print("Verification Failed")
                    }
                }
                .padding()
                
               // Spacer()
            }
            .padding()
            
            
            
            
            
//                TextField("رمز التحقق", text: $verificationCode)
//                    .padding()
//                    .keyboardType(.numberPad)
//                    .background(Color.white)
//                    .cornerRadius(10)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 10)
//                            .stroke(fcolor, lineWidth: 1)
//                    )
                
                    .padding(.horizontal,20)
                Spacer()
                HStack{
                    
                    
                    
                    //Spacer()
                    
                    Button(action: {
                        cancel()
                    }) {
                        Text("لاحقًا")
                            .font(.headline)
                            .foregroundColor(fcolor)
                            .padding()
                            .frame(maxWidth: .infinity)
                        //.background(Color.green)
                            .cornerRadius(10)
                            .background(Color.white)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(fcolor, lineWidth: 1)
                            )
                    }
                    .padding()
                    
                    Button(action: {
                        register()
                    }) {                Button("") {
                        let verificationCode = digit1 + digit2 + digit3 + digit4
                        
                        // Perform verification logic here
                        if verificationCode == "1234" {
                            // Verification code is correct
                            print("Verification Successful")
                        } else {
                            // Verification code is incorrect
                            print("Verification Failed")
                        }
                    }

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
        //}
        
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

struct DigitTextField: View {
    let tag: Int
    @Binding var text: String
    
    var body: some View {
        TextField("", text: $text)
            .keyboardType(.numberPad)
            .frame(width: 50, height: 50)
            .font(.title)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
            .multilineTextAlignment(.center)
            .tag(tag)
    }
}


struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        Registeration()
    }
}


