//
//  المهام.swift
//  Flosna
//
//  Created by Ahlam ALshehri on 25/03/1445 AH.
//

import SwiftUI

struct Task: Identifiable {
    let id = UUID()
    var title: String
    var isCompleted: Bool = false
}

struct المهام: View {
    @State private var tasks = [
        Task(title: " تسديد الجزء المحدد من القرض"),
        Task(title: " تسديد رواتب الموظفين "),
        Task(title: "تسديد الايجار "),
        Task(title: "تسديد الضريبة "),
        Task(title: " طلب المعدات المطلوبة"),
        Task(title: " توفير المبلغ المحدد للحالات الطارئة")
           
           
    ]
        
    var body: some View {
        NavigationView {
            
            VStack {
                Divider()
                    .padding([.top, .leading, .trailing])
                    //Spacer(minLength: 150)
                    Image("Image 1")
                    
                        .resizable()
                        .frame(width: 300, height: 300)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        
                
                
                List(tasks) { task in
                    Toggle(isOn: $tasks[tasks.firstIndex(where: { $0.id == task.id })!].isCompleted) {
                        Text(task.title)
                            .foregroundColor(task.isCompleted ? Color.ourgray2 : Color.ourDarkGreen)
                            //.strikethrough(task.isCompleted)
                        
                    }
                    
                }
            }
            
            .navigationBarTitle("قائمة المهام")
            
        }
        .environment(\.layoutDirection, .rightToLeft)
        .padding()
        
        .listStyle(PlainListStyle())
        .background(Color.clear)
        
    }
    
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        المهام()
    }
}
