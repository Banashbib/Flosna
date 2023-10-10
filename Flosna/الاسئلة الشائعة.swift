//
// دعم.swift
//  Flosna
//
//  Created by Ahlam ALshehri on 24/03/1445 AH.
//

import SwiftUI
import Foundation
struct دعم : View {
    let textColor = Color(red:0.243, green: 0.306, blue: 0.251)
    var body: some View {
 
        VStack {
           
                ZStack {
                    Spacer()
                    Image("دعم")
                    
                        .resizable()
                        .frame(width: 300, height: 300)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .padding(.bottom, 400)
                    VStack{
                        DisclosureGroup("هل يتطلب ربط بالبنك ؟") {
                            Text("لا يتطلب ربط بالبنك")
                                .padding()
                            
                        }
                        .environment(\.layoutDirection, .rightToLeft)
                        DisclosureGroup("هل التطبيق امن من ناحية الخصوصية ؟") {
                            Text("نعم امن جدا ولن يطلع على بياناتك الخاصة احد سواك")
                                .padding()
                            
                        }
                        .environment(\.layoutDirection, .rightToLeft)
         DisclosureGroup("هل يتطلب شخص فقط او اكثر من شخص ؟") {
            Text("يسمح باستخدام التطبيق لشخص او اكثر من شخص")
                                .padding()
                            
                        }
         .environment(\.layoutDirection, .rightToLeft)
                        DisclosureGroup("هل يمكن مشاركة الخطة ؟") {
 Text("نعم، يمكن مشاركة الخطة مع شركاء المشروع حيث يمكنهم الدخول والتعديل والتصفح")
                                .padding()
                            
                        }
                        .environment(\.layoutDirection, .rightToLeft)
                        DisclosureGroup("هل يسمح التطبيق بأكثر من مشروع للشخص الواحد ؟") {
                            Text("نعم، يمكن للتطبيق السماح للشخص الواحد بإنشاء أكثر من مشروع. هذا يعني أن المستخدم سيكون قادرًا على إدارة وتطوير عدة مشاريع في نفس الوقت عبر التطبيق الواحد.")
                                .padding()
                            
                        }
                        .environment(\.layoutDirection, .rightToLeft)
                    }
                    .padding(10)
                    .padding(.bottom, -250)
                    .accentColor(textColor)
            }
            
        }
        
        
    }
   
    }
#Preview {
    دعم()
}
