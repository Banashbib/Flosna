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

struct Tasks: View {
    @State private var tasks = [
       
        Task(title: "تسديد الايجار "),
        Task(title: "تسديد الضريبة "),
        Task(title: " طلب المعدات المطلوبة"),
        Task(title: " تسديد رواتب الموظفين "),
        Task(title: " تسديد الجزء المحدد من القرض"),
        Task(title: " توفير المبلغ المحدد للحالات الطارئة")
           
           
    ]
        
    var body: some View {
        NavigationView {
            
            VStack {
                
                Divider()
                    .padding(.horizontal)
                
             
                Image("Image 1")
                
                    .resizable()
                    .padding([.bottom, .trailing], 50.0)
                    .frame(width: 350, height: 350)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                 
                
                
                VStack(alignment: .trailing){
                    ForEach(tasks) { task in
                        Button(action: {
                            toggleTaskCompletion(task)
                        }) {
                            if task.isCompleted {
                                Image(systemName: "checkmark.square.fill")
                                    .foregroundColor(.green)
                            } else {
                                Image(systemName: "square")
                                    .foregroundColor(.gray)
                            }
                            
                            Text(task.title)
                            
                        }
                        .font(.title3)
                        .foregroundColor(.ourDarkGreen)
                        
                        .padding(.leading, 20)
                        Divider()
                            .padding(.leading, 40.0)
                    }
                }
                
                .padding(.trailing, 20)
  
                
                Spacer()
            }
            
           
            .navigationBarTitle("قائمة المهام")
            .padding(.trailing, 20)
        }
        
        
        .listStyle(PlainListStyle())
        .background(Color.clear)
        
    }
    
    
    
    private func toggleTaskCompletion(_ task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
        }
    }
    
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        Tasks()
    }
}



