//
//  CalendarView.swift
//  WalkCounter
//
//  Created by nokkun on 2021/11/18.
//

import SwiftUI

struct CalendarView: View {
    @StateObject var hkmanager:HKManager
    @State var diff:Int = 0
    @State var total:Int = 0
    @StateObject var holiday = HolidayJP()
    
    var body: some View {
        ZStack{
            
            VStack{
                
                HStack{
                    if let t = hkmanager.getMonthTotalStep(diff: diff){
                        Text("Total " + numberWithComma(t) + " step")
                    }
                    if let t = hkmanager.getRunningTotal(diff: diff){
                        Text(" " + String(t) + " run")
                    }
                }
                HStack{
                    
                    Button(action: {
                        diff -= 1
                    }, label: {
                        Image(systemName: "chevron.backward")
                    })
                    
                    Text(Date().changeMonth(i: diff).DateToStringFormatter(format: "yyyy年M月"))
                        .font(.title2)
                        .padding()
                    
                    Button(action: {
                        diff += 1
                    }, label: {
                        Image(systemName: "chevron.right")
                    })
                    
                }
                
                
                let gridItems = Array(repeating: GridItem(), count: 7)
                
                
                LazyVGrid(columns: gridItems, alignment:.center ,spacing: 0) {
                    let week:[String] = ["日","月","火","水","木","金","土"]
                    //曜日の設定
                    ForEach(week, id:\.self) { i in
                        if(i == "土"){
                            Text(i)
                                .foregroundColor(Color.blue)
                        }else if(i == "日"){
                            Text(i)
                                .foregroundColor(Color.red)
                        }else{
                            Text(i)
                        }
                    }
                    
                    let days = Date().changeMonth(i: diff).getAllDays()
                    let buffer = days[0].getWeekDay()
                    let cellNum = 41
                    ForEach((0...cellNum), id:\.self) { index in
                        BarChartCell(index: index,
                                     days: days,
                                     buffer: buffer,
                                     target: hkmanager.target,
                                     stepdata: hkmanager.StepData,
                                     holiday: holiday,
                                     runnning: hkmanager.RunningDict,
                                     diff: diff)
                    }
                    
                }
                
                HStack{
                    
                    if let time = hkmanager.lastupdate?.DateToStringFormatter(format: "yyyy-MM-dd HH:mm:ss"){
                        Text("LastUpdate:" + time)
                            .font(.footnote)
                    }else{
                        Text("No Update")
                            .font(.footnote)
                    }
                    
                    if(hkmanager.isStepLoading == false){
                        Button(action: {
                            hkmanager.getIntervalSteps()
                        }, label: {
                            Image(systemName: "arrow.clockwise")
                        })
                        .padding()
                    }else{
                        Image(systemName: "clock.fill")
                            .padding()
                    }
                }
                                 
            }
            .gesture(DragGesture(minimumDistance: 10, coordinateSpace: .local)
                        .onEnded({ value in
                            if value.translation.width < 0 {
                                // left
                                diff += 1
                            }
                            
                            if value.translation.width > 0 {
                                // right
                                diff -= 1
                            }
                            
                        }))
            
            if(hkmanager.isStepLoading){
                ProgressView()
                    .scaleEffect(2)
            }
            
        }
    }
    func numberWithComma(_ num: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.decimal
        formatter.groupingSeparator = ","
        formatter.groupingSize = 3

        let result = formatter.string(from: NSNumber(value: num))
        return result ?? ""
    }
    
}

struct BarChartCell: View {
    var index: Int
    var days:[Date]
    var buffer:Int
    var target:Int
    var stepdata:[Date:Int]
    var holiday:HolidayJP
    var runnning:[String:Bool]
    var diff:Int
    
    var body: some View {
        
        VStack{
                        
            //前月
            if( index < buffer){

                let prevMonthday = Array(Date().changeMonth(i: diff - 1).getAllDays().suffix(buffer))
                
                Text(prevMonthday[index].DateToStringFormatter(format: "d"))
                    .font(.footnote)
                    .foregroundColor(.gray)
                
                let key = prevMonthday[index]
                let keyString = prevMonthday[index].DateToStringFormatter(format: "yyyy-MM-dd")
                
                CellView(target: target,
                         isThisMonth: false,
                         step: stepdata[key],
                         isRunnning: runnning[keyString])
            }
            //日付が入るセル
            else if(buffer <= index && index < days.count + buffer){

                let i = index - buffer
                
                let key = days[i].DateToStringFormatter(format: "yyyy-MM-dd")
                
                ZStack{
                    
                    let today = Calendar.current.startOfDay(for: Date())
                    
                    if (days[i] == today){
                    RoundedRectangle(cornerRadius: 0)
                        .fill(Color.white)
                        .opacity(0.3)
                    }
                    
                    let week = days[i].getWeekDay()
                    
                    let color = getColor(week: week, holiday: holiday.data[key])
                    
                    Text(days[i].DateToStringFormatter(format: "d"))
                        .font(.footnote)
                        .foregroundColor(color)
                                        
                }
                                                                        
                CellView(target: target,
                         isThisMonth: true,
                         step: stepdata[days[i]],
                         isRunnning: runnning[key])
                
            }else{
                //来月
                let next = 42 - (days.count + buffer)
                let j = index - (days.count + buffer)
                
                let nextMonthday = Array(Date().changeMonth(i: diff + 1).getAllDays()[0...next])
                
                Text(nextMonthday[j].DateToStringFormatter(format: "d"))
                    .font(.footnote)
                    .foregroundColor(.gray)
                
                let key = nextMonthday[j]
                let keyString = nextMonthday[j].DateToStringFormatter(format: "yyyy-MM-dd")
                
                CellView(target: target,
                         isThisMonth: false,
                         step: stepdata[key],
                         isRunnning: runnning[keyString])
                
            }
        }
    }
    
    func getColor(week:Int,holiday:String?) -> Color {
        switch week {
        case 0: return Color.red
        case 6: return Color.blue
        default: return holiday == nil ? Color("CalendarLabel"): Color.red
        }
    }
    
    func getBarHeight(step:Int) -> (CGFloat,CGFloat?) {
        var ratio = CGFloat(step) / CGFloat(target)
        var ratio2nd:CGFloat?
        if(ratio > 1.0){
            ratio2nd = ratio - 1.0
            ratio = 1.0
            if(ratio2nd! > 1.0){
                ratio2nd = 1.0
            }
        }
        
        return (ratio,ratio2nd)
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(hkmanager: HKManager())
            .preferredColorScheme(.dark)
    }
}
