


//
//  a.swift
//  Flosna
//
//  Created by Hajar Alshehri on 27/03/1445 AH.
//

import SwiftUI
struct Commitment: Identifiable {
    let id = UUID()
    var title: String
    var isCompleted: Bool = false
      
}




struct plan: View {
      @State private var projectName: String = ""
      @State private var projectDescription: String = ""
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
      @State private var cancell = false
      @Environment(\.presentationMode) var presentationMode




        
      @State private var commitments = [
             Commitment(title: "قرض"),
             Commitment(title: "ايجار"),
             Commitment(title: "موظفين")
         ]
        
        
        @State private var partnerNames: [String] = []
        @State private var partnerPercentages: [String] = []

        
        
        let projectTypes = ["مأكولات", "عطور", "ملابس"]
        let projectBudget = ["5000 - 10,000 SR", "10,000 - 15,000 SR","15,000 - 20,000 SR"]
        let loanBudget = ["5000 - 10,000 SR", "10,000 - 15,000 SR", "15,000 - 20,000 SR"]
        let WorkerBudget = ["5000 - 10,000 SR", "10,000 - 15,000 SR", "15,000 - 20,000 SR"]
      let RentBudget = ["5000 - 10,000 SR", "10,000 - 15,000 SR", "15,000 - 20,000 SR"]

      

        
        let fcolor = Color(red: 0.486, green: 0.729, blue: 0.588)
      
      init(projectName: String, projectDescription: String) {
              self._projectName = State(initialValue: projectName)
              self._projectDescription = State(initialValue: projectDescription)
          }
        
      private func toggleCommitmentCompletion(_ commitment: Commitment) {
             if let index = commitments.firstIndex(where: { $0.id == commitment.id }) {
                 commitments[index].isCompleted.toggle()
             }
         }
      
        var body: some View {
              NavigationView {
                    ScrollView {
                          
                          VStack(alignment: .leading, spacing: 20) {
                                
                                Divider()
                                      
                                Text("إداري")
                                      .font(.system(size: 20))
                                      .foregroundColor(.gray)
                                      .padding(.leading)
                                
                                Text("إسم المشروع: ")
                                      .font(.headline)
                                      .padding(.leading)
                                    
                                
                                TextField("إسم المشروع", text: $projectName)
                                      .padding()
                                      .keyboardType(.numberPad)
                                      .background(Color.white)
                                      .cornerRadius(10)
                                      .overlay(
                                          RoundedRectangle(cornerRadius: 10)
                                                .stroke(fcolor, lineWidth: 1)
                                      )
                                      .padding(.horizontal, 20)
                                
//                                VStack(alignment: .leading, spacing: 20) {
//                                      Text("نوع المشروع: ")
//                                            .font(.headline)
//                                            .padding(.leading)
//                                      
//                                      Menu {
//                                            ForEach(projectTypes, id: \.self) { type in
//                                                  Button(action: {
//                                                        selectedProjectType = type
//                                                  }) {
//                                                        Label(type, systemImage: "square")
//                                                  }
//                                            }
//                                      } label: {
//                                            HStack() {
//                                                  Image(systemName: "chevron.down")
//                                                        .foregroundColor(.black)
//                                                  Text(selectedProjectType ?? "اختر نوع المشروع")
//                                                        .foregroundColor(.gray)
//                                            }
//                                            .frame(maxWidth: .infinity)
//                                            .frame(height: 40)
//                                            .background(Color.white)
//                                            .cornerRadius(10)
//                                            .overlay(
//                                                RoundedRectangle(cornerRadius: 10)
//                                                      .stroke(fcolor, lineWidth: 1)
//                                            )
//                                            .padding(.horizontal, 20)
//                                      }
//                                }
                                
                                Text("وصف المشروع: ")
                                      .font(.headline)
                                      .padding(.leading)
                                
                                TextField("وصف المشروع", text: $projectDescription)
                                      .padding()
                                      .keyboardType(.numberPad)
                                      .background(Color.white)
                                      .cornerRadius(10)
                                      .overlay(
                                          RoundedRectangle(cornerRadius: 10)
                                                .stroke(fcolor, lineWidth: 1)
                                      )
                                      .padding(.horizontal, 20)
                                
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
                                                        .foregroundColor(.black)
                                                  Text(selectedProjectBudget ?? "اختر ميزانية المشروع")
                                                        .foregroundColor(.gray)
                                            }
                                            .frame(maxWidth: .infinity)
                                            .frame(height: 40)
                                            .background(Color.white)
                                            .cornerRadius(10)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                      .stroke(fcolor, lineWidth: 1)
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
                                                            .stroke(fcolor, lineWidth: 1)
                                                           
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
                                                          .stroke(fcolor, lineWidth: 1)
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
                                
//                                VStack(alignment: .leading, spacing: 20) {
//                                      
//                                      
//                                      LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
//                                            ForEach(commitments) { commitment in
//                                                  Button(action: {
//                                                        toggleCommitmentCompletion(commitment)
//                                                  }) {
//                                                        HStack {
//                                                              Text(commitment.title)
//                                                                    .font(.subheadline)
//                                                                    .foregroundColor(.ourDarkGreen)
//                                                                    .lineLimit(1)
//                                                              
//                                                              if commitment.isCompleted {
//                                                                    Image(systemName: "checkmark.square.fill")
//                                                                          .foregroundColor(.green)
//                                                              } else {
//                                                                    Image(systemName: "square")
//                                                                          .foregroundColor(.gray)
//                                                              }
//                                                        }
//                                                  }
//                                                  .padding(.horizontal, 20)
//                                            }
//                                      }
//                                      Spacer()
                                      
                                      
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
                                                              .foregroundColor(.black)
                                                        Text(selectedProjectWorker ?? "اختر ميزانية الموظفين")
                                                              .foregroundColor(.gray)
                                                  }
                                                  .frame(maxWidth: .infinity)
                                                  .frame(height: 40)
                                                  .background(Color.white)
                                                  .cornerRadius(10)
                                                  .overlay(
                                                      RoundedRectangle(cornerRadius: 10)
                                                            .stroke(fcolor, lineWidth: 1)
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
                                                              .foregroundColor(.black)
                                                        Text(selectedProjectRent ?? "اختر ميزانية الايجار")
                                                              .foregroundColor(.gray)
                                                  }
                                                  .frame(maxWidth: .infinity)
                                                  .frame(height: 40)
                                                  .background(Color.white)
                                                  .cornerRadius(10)
                                                  .overlay(
                                                      RoundedRectangle(cornerRadius: 10)
                                                            .stroke(fcolor, lineWidth: 1)
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
                                                        .foregroundColor(.black)
                                                  Text(selectedProjectLoan ?? "اختر ميزانية القرض")
                                                        .foregroundColor(.gray)
                                            }
                                            .frame(maxWidth: .infinity)
                                            .frame(height: 40)
                                            .background(Color.white)
                                            .cornerRadius(10)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                      .stroke(fcolor, lineWidth: 1)
                                            )
                                            .padding(.horizontal, 20)
                                      }}
                                            
                                            
                                            Spacer()
                                            HStack {
                                                 
                                            
                                                  Button(action: {
                                                        save = true
                                                        
                                                        presentationMode.wrappedValue.dismiss()
                                                  }) {
                                                        Text("حفظ")
                                                              .foregroundColor(.white)
                                                              .font(.headline)
                                                              .padding()
                                                              .frame(maxWidth: .infinity)
                                                              .background(Color.ourgreen)
                                                              .cornerRadius(10)
                                                  }
                                            
                                            Button(action: {
                                                  cancell = true
                                                  
                                                  
                                            }) {
                                                  Text("الغاء")
                                                        .foregroundColor(Color.ourgreen)
                                                        .font(.headline)
                                                        .padding()
                                                        .frame(maxWidth: .infinity)
                                                        .background(Color.white)
                                                        .cornerRadius(10)
                                                        .overlay(
                                                            RoundedRectangle(cornerRadius: 10).stroke(Color.ourgreen , lineWidth:1))
                                                
                                            }
                                                
                                      }
                                      
                                
                                      }
                                      
                                       
                                      
                                      
                                      
                                      
                                }
                          
                          .padding()

                          .navigationTitle("الخطة")


                    }
              }
                    
        }

      
     

     struct Commitments_Previews: PreviewProvider {
         static var previews: some View {
               plan(projectName:"", projectDescription: "")
               
         }
     }


#Preview {
      plan(projectName: "", projectDescription: "")
            .environment(\.layoutDirection, .rightToLeft)



}
 

