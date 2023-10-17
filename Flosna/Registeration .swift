//
//  Registeration .swift
//  Flosna
//
//  Created by Bana Alshabib on 25/03/1445 AH.
//

import SwiftUI

struct Country: Hashable {
    let name: String
    let dialCode: String
}

struct Registeration: View {
    @State private var isShowingVerificationSheet = false
    @State private var phoneNumber = ""
    @State private var selectedCountry: Country?
    
    let countries: [Country] = [
        Country(name: "🇸🇦", dialCode: "+966"),
        Country(name: "🇦🇪", dialCode: "+971"),
        Country(name: "🇶🇦", dialCode: "+974"),
        // إضافة المزيد من الدول هنا
    ]
    
    var body: some View {
        NavigationView{
            VStack {
                TextField("رقم الهاتف", text: $phoneNumber)
                    .padding()
                    .keyboardType(.numberPad)
                    .background(Color.white)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.ourgreen, lineWidth: 1)
                    )
                    .padding(.horizontal,20)
                    .overlay(
                        Picker("Country", selection: $selectedCountry) {
                            ForEach(countries, id: \.self) { country in
                                Text("\(country.name) (\(country.dialCode))").tag(country)
                            }
                        }
                        
                            .pickerStyle(MenuPickerStyle())
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding(.trailing, 12)
                            .accentColor(.ourgreen)
                    )
                
                    Button(action: {
                        isShowingVerificationSheet = true
                    }) {
                        Text("التحقق")
                            .padding()
                            .frame(width: 322, height: 50)
                            .background(Color.ourgreen)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                NavigationLink(destination: ContentView()){
                    Button(action: {
                        
                    }) {
                        Text("لاحقًا")
                            .padding()
                            .frame(width: 322, height: 50)
                            .background(Color.clear)
                            .foregroundColor(.ourgreen)
                            .cornerRadius(10)
                    }}
                Spacer()
                .sheet(isPresented: $isShowingVerificationSheet) {
                    VerificationSheet(selectedCountry: selectedCountry)
                }
            }
            
            .padding()
            .navigationBarTitle("التسجيل")
            
        }
    }
}

struct VerificationSheet: View {
    @State private var verificationCodes: [String] = Array(repeating: "", count: 4)
    let selectedCountry: Country?
    
    
    var body: some View {
        VStack {
            Text("رمز التحقق")
                .font(.title)
                .padding(.bottom, 20)
            
            HStack {
                ForEach(0..<4, id: \.self) { index in
                    TextField("", text: $verificationCodes[index])
                        .keyboardType(.numberPad)
                        .frame(width: 60, height: 60)
                        .background(Color.white)
                    //.cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.ourgreen, lineWidth: 1)
                        )
                    //                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .onChange(of: verificationCodes[index]) { newValue in
                            // تحقق من عدد الأحرف وحدد الخانة التالية إذا كانت الخانة الحالية ممتلئة
                            if newValue.count > 1 {
                                let currentIndex = index
                                let nextIndex = currentIndex + 1
                                if nextIndex < verificationCodes.count {
                                    DispatchQueue.main.async {
                                        verificationCodes[currentIndex] = String(newValue.prefix(1))
                                        _ = UIResponder.becomeFirstResponder
                                        verificationCodes[nextIndex] = String(newValue.suffix(1))
                                    }
                                } else {
                                    DispatchQueue.main.async {
                                        verificationCodes[currentIndex] = String(newValue.prefix(1))
                                        _ = UIResponder.resignFirstResponder
                                    }
                                }
                            }
                        }
                }
            }
            .padding()
            NavigationLink(destination: ContentView()){
                Button(action: {
                    // يمكنك هنا تنفيذ الإجراء المطلوب بعد التحقق من الرمز
                }) {
                    Text("التسجيل")
                        .padding()
                        .frame(width: 350, height: 50)
                        .background(Color.ourgreen)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
                .padding()
                
                Spacer()
            }
    }
}

struct ReView: View {
    var body: some View {
        Registeration()
        //Registeration
           
    }
}
//#Preview{
//    ReView()
//        .environment(\.layoutDirection, .rightToLeft)
//}



struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        ReView()
            .environment(\.layoutDirection, .rightToLeft)

    }
}


