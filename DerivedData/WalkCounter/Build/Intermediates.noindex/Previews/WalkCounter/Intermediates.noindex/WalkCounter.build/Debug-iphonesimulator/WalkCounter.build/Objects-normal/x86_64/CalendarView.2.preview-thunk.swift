@_private(sourceFile: "CalendarView.swift") import WalkCounter
import SwiftUI
import SwiftUI

extension CalendarView_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/nokkun/Documents/WalkCounter/WalkCounter/CalendarView.swift", line: 252)
        AnyView(CalendarView(hkmanager: HKManager())
            .preferredColorScheme(.dark))
    #sourceLocation()
    }
}

extension BarChartCell {
    @_dynamicReplacement(for: getBarHeight(step:)) private func __preview__getBarHeight(step:Int) -> (CGFloat,CGFloat?) {
        #sourceLocation(file: "/Users/nokkun/Documents/WalkCounter/WalkCounter/CalendarView.swift", line: 236)
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
    #sourceLocation()
    }
}

extension BarChartCell {
    @_dynamicReplacement(for: getColor(week:holiday:)) private func __preview__getColor(week:Int,holiday:String?) -> Color {
        #sourceLocation(file: "/Users/nokkun/Documents/WalkCounter/WalkCounter/CalendarView.swift", line: 228)
        switch week {
        case 0: return Color.red
        case 6: return Color.blue
        default: return holiday == nil ? Color("CalendarLabel"): Color.red
        }
    #sourceLocation()
    }
}

extension BarChartCell {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/nokkun/Documents/WalkCounter/WalkCounter/CalendarView.swift", line: 153)
        
        AnyView(VStack{
                        
            //前月
            if( index < buffer){

                let prevMonthday = Array(Date().changeMonth(i: diff - 1).getAllDays().suffix(buffer))
                
                Text(prevMonthday[index].DateToStringFormatter(format: __designTimeString("#3959.[2].[8].property.[0].[0].arg[0].value.[0].[0].[1].arg[0].value.arg[0].value", fallback: "d")))
                    .font(.footnote)
                    .foregroundColor(.gray)
                
                let key = prevMonthday[index]
                let keyString = prevMonthday[index].DateToStringFormatter(format: __designTimeString("#3959.[2].[8].property.[0].[0].arg[0].value.[0].[0].[3].value.arg[0].value", fallback: "yyyy-MM-dd"))
                
                CellView(target: target,
                         isThisMonth: __designTimeBoolean("#3959.[2].[8].property.[0].[0].arg[0].value.[0].[0].[4].arg[1].value", fallback: false),
                         step: stepdata[key],
                         isRunnning: runnning[keyString])
            }
            //日付が入るセル
            else if(buffer <= index && index < days.count + buffer){

                let i = index - buffer
                
                let key = days[i].DateToStringFormatter(format: __designTimeString("#3959.[2].[8].property.[0].[0].arg[0].value.[0].[1].[1].value.arg[0].value", fallback: "yyyy-MM-dd"))
                
                ZStack{
                    
                    let today = Calendar.current.startOfDay(for: Date())
                    
                    if (days[i] == today){
                    RoundedRectangle(cornerRadius: __designTimeInteger("#3959.[2].[8].property.[0].[0].arg[0].value.[0].[1].[2].arg[0].value.[1].[0].[0].arg[0].value", fallback: 0))
                        .fill(Color.white)
                        .opacity(__designTimeFloat("#3959.[2].[8].property.[0].[0].arg[0].value.[0].[1].[2].arg[0].value.[1].[0].[0].modifier[1].arg[0].value", fallback: 0.3))
                    }
                    
                    let week = days[i].getWeekDay()
                    
                    let color = getColor(week: week, holiday: holiday.data[key])
                    
                    Text(days[i].DateToStringFormatter(format: __designTimeString("#3959.[2].[8].property.[0].[0].arg[0].value.[0].[1].[2].arg[0].value.[4].arg[0].value.arg[0].value", fallback: "d")))
                        .font(.footnote)
                        .foregroundColor(color)
                                        
                }
                                                                        
                CellView(target: target,
                         isThisMonth: __designTimeBoolean("#3959.[2].[8].property.[0].[0].arg[0].value.[0].[1].[3].arg[1].value", fallback: true),
                         step: stepdata[days[i]],
                         isRunnning: runnning[key])
                
            }else{
                //来月
                let next = 42 - (days.count + buffer)
                let j = index - (days.count + buffer)
                
                let nextMonthday = Array(Date().changeMonth(i: diff + 1).getAllDays()[0...next])
                
                Text(nextMonthday[j].DateToStringFormatter(format: __designTimeString("#3959.[2].[8].property.[0].[0].arg[0].value.[0].[2].[3].arg[0].value.arg[0].value", fallback: "d")))
                    .font(.footnote)
                    .foregroundColor(.gray)
                
                let key = nextMonthday[j]
                let keyString = nextMonthday[j].DateToStringFormatter(format: __designTimeString("#3959.[2].[8].property.[0].[0].arg[0].value.[0].[2].[5].value.arg[0].value", fallback: "yyyy-MM-dd"))
                
                CellView(target: target,
                         isThisMonth: __designTimeBoolean("#3959.[2].[8].property.[0].[0].arg[0].value.[0].[2].[6].arg[1].value", fallback: false),
                         step: stepdata[key],
                         isRunnning: runnning[keyString])
                
            }
        })
    #sourceLocation()
    }
}

extension CalendarView {
    @_dynamicReplacement(for: numberWithComma(_:)) private func __preview__numberWithComma(_ num: Int) -> String {
        #sourceLocation(file: "/Users/nokkun/Documents/WalkCounter/WalkCounter/CalendarView.swift", line: 130)
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.decimal
        formatter.groupingSeparator = ","
        formatter.groupingSize = 3

        let result = formatter.string(from: NSNumber(value: num))
        return result ?? ""
    #sourceLocation()
    }
}

extension CalendarView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/nokkun/Documents/WalkCounter/WalkCounter/CalendarView.swift", line: 17)
        AnyView(ZStack{
            
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
                        Image(systemName: __designTimeString("#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[0].arg[1].value.[0].arg[0].value", fallback: "chevron.backward"))
                    })
                    
                    Text(Date().changeMonth(i: diff).DateToStringFormatter(format: __designTimeString("#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[1].arg[0].value.arg[0].value", fallback: "yyyy年M月")))
                        .font(.title2)
                        .padding()
                    
                    Button(action: {
                        diff += 1
                    }, label: {
                        Image(systemName: __designTimeString("#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[2].arg[1].value.[0].arg[0].value", fallback: "chevron.right"))
                    })
                    
                }
                
                
                let gridItems = Array(repeating: GridItem(), count: __designTimeInteger("#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[2].value.arg[1].value", fallback: 7))
                
                
                LazyVGrid(columns: gridItems, alignment:.center ,spacing: __designTimeInteger("#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[3].arg[2].value", fallback: 0)) {
                    let week:[String] = [__designTimeString("#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[3].arg[3].value.[0].value.[0]", fallback: "日"),__designTimeString("#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[3].arg[3].value.[0].value.[1]", fallback: "月"),__designTimeString("#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[3].arg[3].value.[0].value.[2]", fallback: "火"),__designTimeString("#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[3].arg[3].value.[0].value.[3]", fallback: "水"),__designTimeString("#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[3].arg[3].value.[0].value.[4]", fallback: "木"),__designTimeString("#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[3].arg[3].value.[0].value.[5]", fallback: "金"),__designTimeString("#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[3].arg[3].value.[0].value.[6]", fallback: "土")]
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
                    let buffer = days[__designTimeInteger("#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[3].arg[3].value.[3].value.[0].value", fallback: 0)].getWeekDay()
                    let cellNum = __designTimeInteger("#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[3].arg[3].value.[4].value", fallback: 41)
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
                        Text(__designTimeString("#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[4].arg[0].value.[0].[1].[0].arg[0].value", fallback: "No Update"))
                            .font(.footnote)
                    }
                    
                    if(hkmanager.isStepLoading == false){
                        Button(action: {
                            hkmanager.getIntervalSteps()
                        }, label: {
                            Image(systemName: __designTimeString("#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[4].arg[0].value.[1].[0].[0].arg[1].value.[0].arg[0].value", fallback: "arrow.clockwise"))
                        })
                        .padding()
                    }else{
                        Image(systemName: __designTimeString("#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[4].arg[0].value.[1].[1].[0].arg[0].value", fallback: "clock.fill"))
                            .padding()
                    }
                }
                                 
            }
            .gesture(DragGesture(minimumDistance: __designTimeInteger("#3959.[1].[4].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value.arg[0].value", fallback: 10), coordinateSpace: .local)
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
                    .scaleEffect(__designTimeInteger("#3959.[1].[4].property.[0].[0].arg[0].value.[1].[0].[0].modifier[0].arg[0].value", fallback: 2))
            }
            
        })
    #sourceLocation()
    }
}

import struct WalkCounter.CalendarView
import struct WalkCounter.BarChartCell
import struct WalkCounter.CalendarView_Previews