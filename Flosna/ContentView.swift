//
//  ContentView.swift
//  Flosna
//
//  Created by Bana Alshabib on 20/03/1445 AH.
//

import SwiftUI

struct Project: Identifiable {
    var id = UUID()
    var title: String
    var description: String
    var image: Image
    var page1: String
    var page2: String
}

struct ContentView: View {
    @State private var projects: [Project] = []
    @State private var isShowingAddProject = false
    

    var body: some View {
        NavigationView {
            
            VStack {
               // Divider()
                if projects.isEmpty {
                    Text("لاتوجد مشاريع حاليًا")
                        .foregroundColor(.gray)
                        .font(.headline)
                        .padding(.top,300)
                    
                }
               
                    
                List(projects) { project in
                    NavigationLink(destination: ProjectDetail(project: project)) {
                        ProjectRow(project: project)
                    }
                    
                }
                
            }
            .navigationTitle("المشاريع")
                        .navigationBarItems(
                            leading: HStack {
                                NavigationLink(destination: Profile()) {
                                    Image(systemName: "person.circle")
                                        .foregroundColor(.ourgreen)
                                        .font(.system(size: 28))
                                }
                                
                                Button(action: {
                                    isShowingAddProject = true
                                }) {
                                    Image(systemName: "plus")
                                        .foregroundColor(.ourgreen)
                                        .font(.system(size: 25))
                                }
                            }
                        )
                    }
        
        .sheet(isPresented: $isShowingAddProject) {
            AddProjectView(projects: $projects, dismissAction: {
                    isShowingAddProject = false
                })
            
        }
    }
}

struct ProjectRow: View {
    var project: Project
    
    var body: some View {
        VStack(spacing:0){
            VStack{
                //Spacer()
                project.image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 350, height: 250)
                    .clipShape(Rectangle())
                    .padding(.bottom,30)
                    //.padding(.horizontal,20)
                    .background(Color.clear)
                
               
            }
            
            
            VStack {
                            Text(project.title)
                                .font(.headline)
                                
                            Text(project.description)
                                .font(.subheadline)
                        }
            HStack (spacing : 60) {
                Image(systemName: "list.bullet.clipboard.fill")
                    .foregroundColor(.ourgreen)
                    .font(.system(size: 25))
                    .padding()
                
                Image(systemName: "waveform.path.ecg.rectangle.fill")
                    .foregroundColor(.ourgreen)
                    .font(.system(size: 25))
                    .padding()
            }
            
            Spacer()
        }
    }
}

struct ProjectDetail: View {
    var project: Project
    
    var body: some View {
        VStack {
            project.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 100)
            
            Text(project.title)
                .font(.title)
                .padding()
            
            Text(project.description)
                .font(.subheadline)
                //.padding()
                .foregroundColor(.ourgray)
                
            
            Spacer()
        }
        .navigationTitle("تفاصيل المشروع")
    }
}

struct AddProjectView: View {
    @Binding var projects: [Project]
    @State private var title = ""
    @State private var description = ""
    var dismissAction: () -> Void

    
    var body: some View {
        NavigationView {
            Form {
                TextField("العنوان", text: $title)
                TextField("الوصف", text: $description)
                    
            }
            .navigationTitle("إضافة مشروع")
            .navigationBarItems(trailing: Button(action: {
                let newProject = Project(title: title, description: description, image: Image("Rectangle 2"), page1: "list.bullet.clipboard.fill", page2: "waveform.path.ecg.rectangle.fill")
                projects.append(newProject)
                dismissAction()
            }) {
                Text("حفظ")
                    .foregroundColor(.ourgreen)
            })
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
#Preview {
    ContentView()
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProjectsView()
//    }
//}


