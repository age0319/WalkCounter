@_private(sourceFile: "CalendarView.swift") import WalkCounter
import SwiftUI
import SwiftUI

extension CalendarView_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/nokkun/Documents/WalkCounter/WalkCounter/CalendarView.swift", line: 252)
        AnyView(__designTimeSelection(CalendarView(hkmanager: __designTimeSelection(HKManager(), "#3959.[3].[0].property.[0].[0].arg[0].value"))
            .preferredColorScheme(.dark), "#3959.[3].[0].property.[0].[0]"))
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
        case 0: return __designTimeSelection(Color.red, "#3959.[2].[9].[0].[0].[0]")
        case 6: return __designTimeSelection(Color.blue, "#3959.[2].[9].[0].[1].[0]")
        default: return holiday == nil ? Color("CalendarLabel"): Color.red
        }
    #sourceLocation()
    }
}

extension BarChartCell {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/nokkun/Documents/WalkCounter/WalkCounter/CalendarView.swift", line: 153)
        
        AnyView(__designTimeSelection(VStack{
                        
            //前月
            if( index < buffer){

                let prevMonthday = Array(__designTimeSelection(Date().changeMonth(i: diff - 1).getAllDays().suffix(__designTimeSelection(buffer, "#3959.[2].[8].property.[0].[0].arg[0].value.[0].[0].[0].value.arg[0].value.modifier[2].arg[0].value")), "#3959.[2].[8].property.[0].[0].arg[0].value.[0].[0].[0].value.arg[0].value"))
                
                __designTimeSelection(Text(prevMonthday[index].DateToStringFormatter(format: __designTimeString("#3959.[2].[8].property.[0].[0].arg[0].value.[0].[0].[1].arg[0].value.arg[0].value", fallback: "d")))
                    .font(.footnote)
                    .foregroundColor(.gray), "#3959.[2].[8].property.[0].[0].arg[0].value.[0].[0].[1]")
                
                let key = prevMonthday[__designTimeSelection(index, "#3959.[2].[8].property.[0].[0].arg[0].value.[0].[0].[2].value.[0].value")]
                let keyString = prevMonthday[index].DateToStringFormatter(format: __designTimeString("#3959.[2].[8].property.[0].[0].arg[0].value.[0].[0].[3].value.arg[0].value", fallback: "yyyy-MM-dd"))
                
                __designTimeSelection(CellView(target: __designTimeSelection(target, "#3959.[2].[8].property.[0].[0].arg[0].value.[0].[0].[4].arg[0].value"),
                         isThisMonth: __designTimeBoolean("#3959.[2].[8].property.[0].[0].arg[0].value.[0].[0].[4].arg[1].value", fallback: false),
                         step: __designTimeSelection(stepdata[__designTimeSelection(key, "#3959.[2].[8].property.[0].[0].arg[0].value.[0].[0].[4].arg[2].value.[0].value")], "#3959.[2].[8].property.[0].[0].arg[0].value.[0].[0].[4].arg[2].value"),
                         isRunnning: __designTimeSelection(runnning[__designTimeSelection(keyString, "#3959.[2].[8].property.[0].[0].arg[0].value.[0].[0].[4].arg[3].value.[0].value")], "#3959.[2].[8].property.[0].[0].arg[0].value.[0].[0].[4].arg[3].value")), "#3959.[2].[8].property.[0].[0].arg[0].value.[0].[0].[4]")
            }
            //日付が入るセル
            else if(buffer <= index && index < days.count + buffer){

                let i = index - buffer
                
                let key = days[i].DateToStringFormatter(format: __designTimeString("#3959.[2].[8].property.[0].[0].arg[0].value.[0].[1].[1].value.arg[0].value", fallback: "yyyy-MM-dd"))
                
                __designTimeSelection(ZStack{
                    
                    let today = Calendar.current.startOfDay(for: __designTimeSelection(Date(), "#3959.[2].[8].property.[0].[0].arg[0].value.[0].[1].[2].arg[0].value.[0].value.modifier[0].arg[0].value"))
                    
                    if (days[i] == today){
                    __designTimeSelection(RoundedRectangle(cornerRadius: __designTimeInteger("#3959.[2].[8].property.[0].[0].arg[0].value.[0].[1].[2].arg[0].value.[1].[0].[0].arg[0].value", fallback: 0))
                        .fill(__designTimeSelection(Color.white, "#3959.[2].[8].property.[0].[0].arg[0].value.[0].[1].[2].arg[0].value.[1].[0].[0].modifier[0].arg[0].value"))
                        .opacity(__designTimeFloat("#3959.[2].[8].property.[0].[0].arg[0].value.[0].[1].[2].arg[0].value.[1].[0].[0].modifier[1].arg[0].value", fallback: 0.3)), "#3959.[2].[8].property.[0].[0].arg[0].value.[0].[1].[2].arg[0].value.[1].[0].[0]")
                    }
                    
                    let week = days[__designTimeSelection(i, "#3959.[2].[8].property.[0].[0].arg[0].value.[0].[1].[2].arg[0].value.[2].value.[0].value")].getWeekDay()
                    
                    let color = getColor(week: __designTimeSelection(week, "#3959.[2].[8].property.[0].[0].arg[0].value.[0].[1].[2].arg[0].value.[3].value.arg[0].value"), holiday: __designTimeSelection(holiday.data[__designTimeSelection(key, "#3959.[2].[8].property.[0].[0].arg[0].value.[0].[1].[2].arg[0].value.[3].value.arg[1].value.[0].value")], "#3959.[2].[8].property.[0].[0].arg[0].value.[0].[1].[2].arg[0].value.[3].value.arg[1].value"))
                    
                    __designTimeSelection(Text(days[i].DateToStringFormatter(format: __designTimeString("#3959.[2].[8].property.[0].[0].arg[0].value.[0].[1].[2].arg[0].value.[4].arg[0].value.arg[0].value", fallback: "d")))
                        .font(.footnote)
                        .foregroundColor(__designTimeSelection(color, "#3959.[2].[8].property.[0].[0].arg[0].value.[0].[1].[2].arg[0].value.[4].modifier[1].arg[0].value")), "#3959.[2].[8].property.[0].[0].arg[0].value.[0].[1].[2].arg[0].value.[4]")
                                        
                }, "#3959.[2].[8].property.[0].[0].arg[0].value.[0].[1].[2]")
                                                                        
                __designTimeSelection(CellView(target: __designTimeSelection(target, "#3959.[2].[8].property.[0].[0].arg[0].value.[0].[1].[3].arg[0].value"),
                         isThisMonth: __designTimeBoolean("#3959.[2].[8].property.[0].[0].arg[0].value.[0].[1].[3].arg[1].value", fallback: true),
                         step: __designTimeSelection(stepdata[__designTimeSelection(days[__designTimeSelection(i, "#3959.[2].[8].property.[0].[0].arg[0].value.[0].[1].[3].arg[2].value.[0].value.[0].value")], "#3959.[2].[8].property.[0].[0].arg[0].value.[0].[1].[3].arg[2].value.[0].value")], "#3959.[2].[8].property.[0].[0].arg[0].value.[0].[1].[3].arg[2].value"),
                         isRunnning: __designTimeSelection(runnning[__designTimeSelection(key, "#3959.[2].[8].property.[0].[0].arg[0].value.[0].[1].[3].arg[3].value.[0].value")], "#3959.[2].[8].property.[0].[0].arg[0].value.[0].[1].[3].arg[3].value")), "#3959.[2].[8].property.[0].[0].arg[0].value.[0].[1].[3]")
                
            }else{
                //来月
                let next = 42 - (days.count + buffer)
                let j = index - (days.count + buffer)
                
                let nextMonthday = Array(Date().changeMonth(i: diff + 1).getAllDays()[0...next])
                
                __designTimeSelection(Text(nextMonthday[j].DateToStringFormatter(format: __designTimeString("#3959.[2].[8].property.[0].[0].arg[0].value.[0].[2].[3].arg[0].value.arg[0].value", fallback: "d")))
                    .font(.footnote)
                    .foregroundColor(.gray), "#3959.[2].[8].property.[0].[0].arg[0].value.[0].[2].[3]")
                
                let key = nextMonthday[__designTimeSelection(j, "#3959.[2].[8].property.[0].[0].arg[0].value.[0].[2].[4].value.[0].value")]
                let keyString = nextMonthday[j].DateToStringFormatter(format: __designTimeString("#3959.[2].[8].property.[0].[0].arg[0].value.[0].[2].[5].value.arg[0].value", fallback: "yyyy-MM-dd"))
                
                __designTimeSelection(CellView(target: __designTimeSelection(target, "#3959.[2].[8].property.[0].[0].arg[0].value.[0].[2].[6].arg[0].value"),
                         isThisMonth: __designTimeBoolean("#3959.[2].[8].property.[0].[0].arg[0].value.[0].[2].[6].arg[1].value", fallback: false),
                         step: __designTimeSelection(stepdata[__designTimeSelection(key, "#3959.[2].[8].property.[0].[0].arg[0].value.[0].[2].[6].arg[2].value.[0].value")], "#3959.[2].[8].property.[0].[0].arg[0].value.[0].[2].[6].arg[2].value"),
                         isRunnning: __designTimeSelection(runnning[__designTimeSelection(keyString, "#3959.[2].[8].property.[0].[0].arg[0].value.[0].[2].[6].arg[3].value.[0].value")], "#3959.[2].[8].property.[0].[0].arg[0].value.[0].[2].[6].arg[3].value")), "#3959.[2].[8].property.[0].[0].arg[0].value.[0].[2].[6]")
                
            }
        }, "#3959.[2].[8].property.[0].[0]"))
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

        let result = formatter.string(from: __designTimeSelection(NSNumber(value: __designTimeSelection(num, "#3959.[1].[5].[4].value.modifier[0].arg[0].value.arg[0].value")), "#3959.[1].[5].[4].value.modifier[0].arg[0].value"))
        return result ?? ""
    #sourceLocation()
    }
}

extension CalendarView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/nokkun/Documents/WalkCounter/WalkCounter/CalendarView.swift", line: 17)
        AnyView(__designTimeSelection(ZStack{
            
            __designTimeSelection(VStack{
                
                __designTimeSelection(HStack{
                    if let t = hkmanager.getMonthTotalStep(diff: diff){
                        __designTimeSelection(Text("Total " + numberWithComma(t) + " step"), "#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[0].[0].[0]")
                    }
                    if let t = hkmanager.getRunningTotal(diff: diff){
                        __designTimeSelection(Text(" " + String(t) + " run"), "#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[1].[0].[0]")
                    }
                }, "#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[0]")
                __designTimeSelection(HStack{
                    
                    __designTimeSelection(Button(action: {
                        diff -= 1
                    }, label: {
                        __designTimeSelection(Image(systemName: __designTimeString("#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[0].arg[1].value.[0].arg[0].value", fallback: "chevron.backward")), "#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[0].arg[1].value.[0]")
                    }), "#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[0]")
                    
                    __designTimeSelection(Text(Date().changeMonth(i: diff).DateToStringFormatter(format: __designTimeString("#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[1].arg[0].value.arg[0].value", fallback: "yyyy年M月")))
                        .font(.title2)
                        .padding(), "#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[1]")
                    
                    __designTimeSelection(Button(action: {
                        diff += 1
                    }, label: {
                        __designTimeSelection(Image(systemName: __designTimeString("#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[2].arg[1].value.[0].arg[0].value", fallback: "chevron.right")), "#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[2].arg[1].value.[0]")
                    }), "#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[2]")
                    
                }, "#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[1]")
                
                
                let gridItems = Array(repeating: __designTimeSelection(GridItem(), "#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[2].value.arg[0].value"), count: __designTimeInteger("#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[2].value.arg[1].value", fallback: 7))
                
                
                __designTimeSelection(LazyVGrid(columns: __designTimeSelection(gridItems, "#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[3].arg[0].value"), alignment:.center ,spacing: __designTimeInteger("#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[3].arg[2].value", fallback: 0)) {
                    let week:[String] = [__designTimeString("#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[3].arg[3].value.[0].value.[0]", fallback: "日"),__designTimeString("#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[3].arg[3].value.[0].value.[1]", fallback: "月"),__designTimeString("#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[3].arg[3].value.[0].value.[2]", fallback: "火"),__designTimeString("#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[3].arg[3].value.[0].value.[3]", fallback: "水"),__designTimeString("#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[3].arg[3].value.[0].value.[4]", fallback: "木"),__designTimeString("#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[3].arg[3].value.[0].value.[5]", fallback: "金"),__designTimeString("#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[3].arg[3].value.[0].value.[6]", fallback: "土")]
                    //曜日の設定
                    __designTimeSelection(ForEach(__designTimeSelection(week, "#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[3].arg[3].value.[1].arg[0].value"), id:\.self) { i in
                        if(i == "土"){
                            __designTimeSelection(Text(__designTimeSelection(i, "#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[3].arg[3].value.[1].arg[2].value.[0].[0].[0].arg[0].value"))
                                .foregroundColor(__designTimeSelection(Color.blue, "#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[3].arg[3].value.[1].arg[2].value.[0].[0].[0].modifier[0].arg[0].value")), "#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[3].arg[3].value.[1].arg[2].value.[0].[0].[0]")
                        }else if(i == "日"){
                            __designTimeSelection(Text(__designTimeSelection(i, "#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[3].arg[3].value.[1].arg[2].value.[0].[1].[0].arg[0].value"))
                                .foregroundColor(__designTimeSelection(Color.red, "#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[3].arg[3].value.[1].arg[2].value.[0].[1].[0].modifier[0].arg[0].value")), "#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[3].arg[3].value.[1].arg[2].value.[0].[1].[0]")
                        }else{
                            __designTimeSelection(Text(__designTimeSelection(i, "#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[3].arg[3].value.[1].arg[2].value.[0].[2].[0].arg[0].value")), "#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[3].arg[3].value.[1].arg[2].value.[0].[2].[0]")
                        }
                    }, "#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[3].arg[3].value.[1]")
                    
                    let days = Date().changeMonth(i: __designTimeSelection(diff, "#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[3].arg[3].value.[2].value.modifier[0].arg[0].value")).getAllDays()
                    let buffer = days[__designTimeInteger("#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[3].arg[3].value.[3].value.[0].value", fallback: 0)].getWeekDay()
                    let cellNum = __designTimeInteger("#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[3].arg[3].value.[4].value", fallback: 41)
                    __designTimeSelection(ForEach((0...cellNum), id:\.self) { index in
                        __designTimeSelection(BarChartCell(index: __designTimeSelection(index, "#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[3].arg[3].value.[5].arg[2].value.[0].arg[0].value"),
                                     days: __designTimeSelection(days, "#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[3].arg[3].value.[5].arg[2].value.[0].arg[1].value"),
                                     buffer: __designTimeSelection(buffer, "#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[3].arg[3].value.[5].arg[2].value.[0].arg[2].value"),
                                     target: __designTimeSelection(hkmanager.target, "#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[3].arg[3].value.[5].arg[2].value.[0].arg[3].value"),
                                     stepdata: __designTimeSelection(hkmanager.StepData, "#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[3].arg[3].value.[5].arg[2].value.[0].arg[4].value"),
                                     holiday: __designTimeSelection(holiday, "#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[3].arg[3].value.[5].arg[2].value.[0].arg[5].value"),
                                     runnning: __designTimeSelection(hkmanager.RunningDict, "#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[3].arg[3].value.[5].arg[2].value.[0].arg[6].value"),
                                     diff: __designTimeSelection(diff, "#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[3].arg[3].value.[5].arg[2].value.[0].arg[7].value")), "#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[3].arg[3].value.[5].arg[2].value.[0]")
                    }, "#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[3].arg[3].value.[5]")
                    
                }, "#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[3]")
                
                __designTimeSelection(HStack{
                    
                    if let time = hkmanager.lastupdate?.DateToStringFormatter(format: "yyyy-MM-dd HH:mm:ss"){
                        __designTimeSelection(Text("LastUpdate:" + time)
                            .font(.footnote), "#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[4].arg[0].value.[0].[0].[0]")
                    }else{
                        __designTimeSelection(Text(__designTimeString("#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[4].arg[0].value.[0].[1].[0].arg[0].value", fallback: "No Update"))
                            .font(.footnote), "#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[4].arg[0].value.[0].[1].[0]")
                    }
                    
                    if(hkmanager.isStepLoading == false){
                        __designTimeSelection(Button(action: {
                            __designTimeSelection(hkmanager.getIntervalSteps(), "#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[4].arg[0].value.[1].[0].[0].arg[0].value.[0]")
                        }, label: {
                            __designTimeSelection(Image(systemName: __designTimeString("#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[4].arg[0].value.[1].[0].[0].arg[1].value.[0].arg[0].value", fallback: "arrow.clockwise")), "#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[4].arg[0].value.[1].[0].[0].arg[1].value.[0]")
                        })
                        .padding(), "#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[4].arg[0].value.[1].[0].[0]")
                    }else{
                        __designTimeSelection(Image(systemName: __designTimeString("#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[4].arg[0].value.[1].[1].[0].arg[0].value", fallback: "clock.fill"))
                            .padding(), "#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[4].arg[0].value.[1].[1].[0]")
                    }
                }, "#3959.[1].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[4]")
                                 
            }
            .gesture(__designTimeSelection(DragGesture(minimumDistance: __designTimeInteger("#3959.[1].[4].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value.arg[0].value", fallback: 10), coordinateSpace: .local)
                        .onEnded({ value in
                            if value.translation.width < 0 {
                                // left
                                diff += 1
                            }
                            
                            if value.translation.width > 0 {
                                // right
                                diff -= 1
                            }
                            
                        }), "#3959.[1].[4].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value")), "#3959.[1].[4].property.[0].[0].arg[0].value.[0]")
            
            if(hkmanager.isStepLoading){
                __designTimeSelection(ProgressView()
                    .scaleEffect(__designTimeInteger("#3959.[1].[4].property.[0].[0].arg[0].value.[1].[0].[0].modifier[0].arg[0].value", fallback: 2)), "#3959.[1].[4].property.[0].[0].arg[0].value.[1].[0].[0]")
            }
            
        }, "#3959.[1].[4].property.[0].[0]"))
    #sourceLocation()
    }
}

import struct WalkCounter.CalendarView
import struct WalkCounter.BarChartCell
import struct WalkCounter.CalendarView_Previews