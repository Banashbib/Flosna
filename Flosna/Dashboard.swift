import SwiftUI
import SwiftUICharts

struct DashboardView: View {
    let data: [(String, Double)] = [("اجمالي الارباح", 20), ("الربح الصافي", 10), ("عائد المال الاستثماري", 60), ("صافي العوائد", 50)]

    let chartStyle = ChartStyle(backgroundColor: Color.white, accentColor: Colors.BorderBlue, secondGradientColor: Colors.OrangeEnd, textColor: Color.black, legendTextColor: Color.gray, dropShadowColor: Color.gray )
    
    
    let chartStyle0 = ChartStyle(backgroundColor: Color.white, accentColor: Colors.BorderBlue, secondGradientColor: Colors.DarkPurple, textColor: Color.black, legendTextColor: Color.gray, dropShadowColor: Color.gray )
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 30) {
            
               
            Divider()
                .padding(.horizontal,20)
            VStack(){
                HStack(){              
                    
        
                    PieChartView(data: [30, 50, 20, 10], title: "النسبة المستحقة لمتطلبات المشروع",style: chartStyle)
                
                    
                    
                    BarChartView(data: ChartData(values: data), title: "العوائد المالية",style: chartStyle0)
                    
                }

                
                HStack(){   LineChartView(data: [8,23,54,32,12,37,7,23,43], title:"الارباح")
                    MultiLineChartView(data: [([8,32,11,23,40,28], GradientColors.green), ([90,99,78,111,70,60,77], GradientColors.purple), ([34,56,72,38,43,100,50], GradientColors.orngPink)], title: "التدفق المالي")
                    
                }
                
                
            }
          .padding()
          
        }
        .navigationTitle( "التحليل المالي")  .padding().environment(\.layoutDirection, .leftToRight)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}

