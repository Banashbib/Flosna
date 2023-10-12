//
//  test.swift
//  Flosna
//
//  Created by Ahlam ALshehri on 26/03/1445 AH.
//

import SwiftUI

struct test: Identifiable {
    let id = UUID()
    var title: String
    var isCompleted: Bool = false
}

struct testt: View {
    @State private var tasks = [
        Task(title: "مهمة 1"),
        Task(title: "مهمة 2"),
        Task(title: "مهمة 3")
    ]
    
    var body: some View {
        VStack {
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
                .font(.title)
            }
        }
    }
    
    private func toggleTaskCompletion(_ task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
