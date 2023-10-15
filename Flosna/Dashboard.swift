import SwiftUI
import SwiftUICharts

struct DashboardView: View {
    let data: [(String, Double)] = [("اجمالي الارباح", 20), ("الربح الصافي", 10), ("عائد المال الاستثماري", 60), ("صافي العوائد", 50)]

    
    var body: some View {
        VStack(spacing: 20) {
            Text("التحليل المالي")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            Divider()
                .padding(.horizontal,20)
            VStack(){
                HStack(){               PieChartView(data: [30, 50, 20,10], title: "النسبة المستحقة لمتطلبات المشروع")
                        .foregroundColor(.green)
                
                    
                    
                    BarChartView(data: ChartData(values: data), title: "الربحية والعوائد المالية")
                    
                }

                
                HStack(){   LineChartView(data: [8,23,54,32,12,37,7,23,43], title:"الارباح")
                    LineChartView(data: [88,77,40], title: "ت")
                    
                }
                
                
            }
                
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}