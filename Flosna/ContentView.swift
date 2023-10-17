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
                //Divider()
                if projects.isEmpty {
                    Text("لاتوجد مشاريع")
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
            .navigationBarItems(trailing: Button(action: {
                isShowingAddProject = true
            }) {
                Image(systemName: "plus")
                    .foregroundColor(.ourgreen)
                    .font(.system(size: 25))
                NavigationLink(destination: Profile()) {
                    Image(systemName: "person.circle")
                        .foregroundColor(.ourgreen)
                        .font(.system(size: 28))
                }
                .padding(.leading, 250.0)
            })
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
          
            
            
            VStack(alignment: .leading) {
                            Text(project.title)
                                .font(.headline)
                            Text(project.description)
                                .font(.subheadline)
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
                .frame(height: 200)
            
            Text(project.title)
                .font(.title)
                .padding()
            
            Text(project.description)
                .font(.subheadline)
                //.padding()
                .foregroundColor(.gray)
            
            HStack(spacing: 60) {
                NavigationLink(destination: Tasks()) {
                    Image(systemName: "list.bullet.clipboard.fill")
                        .foregroundColor(.ourgreen)
                        .padding()
                }
               .buttonStyle(PlainButtonStyle())
                
                NavigationLink(destination: DashboardView()) {
                    Image(systemName: "waveform.path.ecg.rectangle.fill")
                        .foregroundColor(.ourgreen)
                        .padding()
                }
                .buttonStyle(PlainButtonStyle())
            }
                
            
            Spacer()
        }
        .navigationTitle("تفاصيل المشروع")
    }
}

struct AddProjectView: View {
    @State private var partnerName: String = ""
    @State private var partnerPercentage: String = ""
    @State private var selectedLoanBudget: String? = nil
    @State private var isShowingProjectTypes: Bool = false
    @State private var selectedProjectType: String? = nil
    @State private var selectedProjectBudget: String? = nil
    @State private var selectedProjectLoan: String? = nil
    @State private var selectedProjectWorker: String? = nil
    @State private var selectedProjectRent: String? = nil
    @State private var save = false
    @State private var commitments = [
           Commitment(title: "قرض"),
           Commitment(title: "ايجار"),
           Commitment(title: "موظفين")
       ]
      
      
      @State private var partnerNames: [String] = []
      @State private var partnerPercentages: [String] = []

    @Environment(\.presentationMode) var presentationMode

      
      let projectTypes = ["مأكولات", "عطور", "ملابس"]
      let projectBudget = ["5000 - 10,000 SR", "10,000 - 15,000 SR","15,000 - 20,000 SR"]
      let loanBudget = ["5000 - 10,000 SR", "10,000 - 15,000 SR", "15,000 - 20,000 SR"]
      let WorkerBudget = ["5000 - 10,000 SR", "10,000 - 15,000 SR", "15,000 - 20,000 SR"]
    let RentBudget = ["5000 - 10,000 SR", "10,000 - 15,000 SR", "15,000 - 20,000 SR"]

    @Binding var projects: [Project]
    @State private var title = ""
    @State private var description = ""
    var dismissAction: () -> Void
     
    private func toggleCommitmentCompletion(_ commitment: Commitment) {
           if let index = commitments.firstIndex(where: { $0.id == commitment.id }) {
               commitments[index].isCompleted.toggle()
           }
       }

var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading,  spacing:20){
                    Text("إداري")
                        .font(.system(size: 20))
                        .foregroundColor(.gray)
                        .padding()
                    
                    Text("إسم المشروع: ")
                        .font(.headline)
                        .padding(.leading)
                    
                    TextField("إسم المشروع", text: $title)
                        .foregroundColor(.gray)
                        .padding()
                    //.keyboardType()
                        .background(Color.white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.ourgreen, lineWidth: 1)
                        )
                        .padding(.horizontal, 20)
                    Text("وصف المشروع: ")
                        .font(.headline)
                        .padding(.leading)
                    TextField("وصف المشروع", text: $description)
                        
                        .foregroundColor(.gray)
                        .padding()
                    
                        .background(Color.white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.ourgreen, lineWidth: 1)
                        )
                        .padding(.horizontal, 20)
                    VStack(alignment: .leading, spacing: 20) {
                        Text("نوع المشروع: ")
                            .font(.headline)
                            .padding(.leading)
                        
                        Menu {
                            ForEach(projectTypes, id: \.self) { type in
                                Button(action: {
                                    selectedProjectType = type
                                }) {
                                    Label(type, systemImage: "square")
                                }
                            }
                        } label: {
                            HStack() {
                                Image(systemName: "chevron.down")
                                    .foregroundColor(.gray)
                                Text(selectedProjectType ?? "اختر نوع المشروع")
                                    .foregroundColor(.gray)
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 55)
                            .background(Color.white)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.ourgreen, lineWidth: 1)
                            )
                            .padding(.horizontal, 20)
                           
                        }
                    }
                    VStack(alignment: .leading, spacing: 20) {
                        Text("ميزانية المشروع: ")
                            .font(.headline)
                            .padding(.leading)
                        
                        Menu {
                            ForEach(projectBudget, id: \.self) { type in
                                Button(action: {
                                    selectedProjectBudget = type
                                }) {
                                    Label(type, systemImage: "square")
                                }
                            }
                        } label: {
                            HStack {
                                Image(systemName: "chevron.down")
                                    .foregroundColor(.gray)
                                Text(selectedProjectBudget ?? "اختر ميزانية المشروع")
                                    .foregroundColor(.gray)
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 55)
                            .background(Color.white)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.ourgreen, lineWidth: 1)
                            )
                            .padding(.horizontal, 20)
                        }
                    }
                    Spacer()
                    Text("مالي")
                        .font(.system(size: 20))
                        .foregroundColor(.gray)
                        .padding(.leading)
                    
                    Text("الشريك : ")
                        .font(.headline)
                        .padding(.leading)
                    ForEach(0..<partnerNames.count, id: \.self) { index in
                        HStack(spacing: 20) {
                            TextField("إسم الشريك", text: Binding(
                                get: { partnerNames[index] },
                                set: { partnerNames[index] = $0 }
                                
                            ))
                            .padding()
                            .frame(width: 150, height: 45)
                            .keyboardType(.numberPad)
                            .background(Color.white)
                            .cornerRadius(10)
                            
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.ourgreen, lineWidth: 1)
                                
                            )
                            TextField("نسبة الشريك", text: Binding(
                                get: { partnerPercentages[index] },
                                set: { partnerPercentages[index] = $0 }
                            ))
                            .padding()
                            .frame(width: 150, height: 45)
                            .keyboardType(.numberPad)
                            .background(Color.white)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.ourgreen, lineWidth: 1)
                            )
                            
                            Button(action: {
                                        partnerNames.remove(at: index)
                                        partnerPercentages.remove(at: index)
                                    }) {
                                        Image(systemName: "trash")
                                            .foregroundColor(.gray)
                                    }
                        }
                        .padding()
                    }
                    Button(action: {
                        partnerNames.append("")
                        partnerPercentages.append("")
                    }) {
                        Text("إضافة شريك")
                            .foregroundColor(.ourgreen)
                    }
                    .padding(.horizontal, 20)
                    
                    
                    Spacer()
                    
                    Text("الإلتزامات")
                        .font(.system(size: 20))
                        .foregroundColor(.gray)
                        .padding(.leading)
                    VStack(alignment: .leading, spacing: 20) {
                          
                          
                          LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                                ForEach(commitments) { commitment in
                                      Button(action: {
                                            toggleCommitmentCompletion(commitment)
                                      }) {
                                            HStack {
                                                  Text(commitment.title)
                                                        .font(.subheadline)
                                                        .foregroundColor(.ourDarkGreen)
                                                        .lineLimit(1)
                                                  
                                                  if commitment.isCompleted {
                                                        Image(systemName: "checkmark.square.fill")
                                                              .foregroundColor(.green)
                                                  } else {
                                                        Image(systemName: "square")
                                                              .foregroundColor(.gray)
                                                  }
                                            }
                                      }
                                      .padding(.horizontal, 20)
                                }
                          }
                          Spacer()
                        VStack(alignment: .leading, spacing: 20) {
                              
                              
                              Text("ميزانية الموظفين: ")
                                    .font(.headline)
                                    .padding(.leading)
                              
                              Menu {
                                    ForEach(WorkerBudget, id: \.self) { type in
                                          Button(action: {
                                                selectedProjectWorker = type
                                          }) {
                                                Label(type, systemImage: "square")
                                          }
                                    }
                              } label: {
                                    HStack {
                                          Image(systemName: "chevron.down")
                                                .foregroundColor(.gray)
                                          Text(selectedProjectWorker ?? "اختر ميزانية الموظفين")
                                                .foregroundColor(.gray)
                                    }
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 55)
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.ourgreen, lineWidth: 1)
                                    )
                                    .padding(.horizontal, 20)
                              }
                        }
                        VStack(alignment: .leading, spacing: 20) {
                              
                              
                              Text("ميزانية الايجار: ")
                                    .font(.headline)
                                    .padding(.leading)
                              
                              Menu {
                                    ForEach(RentBudget, id: \.self) { type in
                                          Button(action: {
                                                selectedProjectRent = type
                                          }) {
                                                Label(type, systemImage: "square")
                                          }
                                    }
                              } label: {
                                    HStack {
                                          Image(systemName: "chevron.down")
                                                .foregroundColor(.gray)
                                          Text(selectedProjectRent ?? "اختر ميزانية الايجار")
                                                .foregroundColor(.gray)
                                    }
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 55)
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.ourgreen, lineWidth: 1)
                                    )
                                    .padding(.horizontal, 20)
                              }
                        }
                        VStack(alignment: .leading, spacing: 20) {
                            Text("ميزانية القرض: ")
                                .font(.headline)
                                .padding(.leading)
                            Menu {
                                ForEach(loanBudget, id: \.self) { type in
                                    Button(action: {
                                        selectedProjectLoan = type
                                    }) {
                                        Label(type, systemImage: "square")
                                    }
                                }
                            } label: {
                                HStack {
                                    Image(systemName: "chevron.down")
                                        .foregroundColor(.gray)
                                    Text(selectedProjectLoan ?? "اختر ميزانية القرض")
                                        .foregroundColor(.gray)
                                }
                                .frame(maxWidth: .infinity)
                                .frame(height: 55)
                                .background(Color.white)
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.ourgreen, lineWidth: 1)
                                )
                                .padding(.horizontal, 20)
                            }
                            
                            Spacer()
                            Button(action: {
                                  save = true
                                  
                                  presentationMode.wrappedValue.dismiss()
                                let newProject = Project(title: title, description: description, image: Image("Rectangle 2"), page1: "list.bullet.clipboard.fill", page2: "waveform.path.ecg.rectangle.fill")
                                                projects.append(newProject)
                                                dismissAction()

                                
                                
                            }) {
                                
                                  Text("حفظ")
                                            .foregroundColor(.white)
                                            .font(.headline)
                                            .padding()
                                            .frame(width: 300, height: 45)
                                            .background(Color.ourgreen)
                                            .cornerRadius(10)
                                            .frame(maxWidth: .infinity) 
                                            .padding(.horizontal, 20)
                            }
                            
                        }
                            
                        
                        
                        
                        
                        
                }
                }
                
            } 
            .navigationTitle("الخطة")
            
           
//            .navigationBarItems(trailing: Button(action: {
//                let newProject = Project(title: title, description: description, image: Image("Rectangle 2"), page1: "list.bullet.clipboard.fill", page2: "waveform.path.ecg.rectangle.fill")
//                projects.append(newProject)
//                dismissAction()
//            }) {
//                Text("حفظ")
//                    .foregroundColor(.ourgreen)
//                    .environment(\.layoutDirection, .rightToLeft)
//            })
        }.environment(\.layoutDirection, .rightToLeft)

    }
}



//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
#Preview {
    ContentView()
        .environment(\.layoutDirection, .rightToLeft)
    
}





