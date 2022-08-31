@_private(sourceFile: "WorkoutView.swift") import WalkCounter
import SwiftUI
import SwiftUI

extension WorkoutView_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/nokkun/Documents/WalkCounter/WalkCounter/WorkoutView.swift", line: 110)
        AnyView(__designTimeSelection(WorkoutView(hkmanager: __designTimeSelection(HKManager(), "#47291.[2].[0].property.[0].[0].arg[0].value"))
            .preferredColorScheme(.dark), "#47291.[2].[0].property.[0].[0]"))
    #sourceLocation()
    }
}

extension WorkoutView {
    @_dynamicReplacement(for: stringFromTimeInterval(interval:)) private func __preview__stringFromTimeInterval(interval: TimeInterval) -> String {
        #sourceLocation(file: "/Users/nokkun/Documents/WalkCounter/WalkCounter/WorkoutView.swift", line: 91)
        
        let ti = NSInteger(__designTimeSelection(interval, "#47291.[1].[3].[0].value.arg[0].value"))
//        let seconds = ti % 60
        let minutes = (ti / 60) % 60
        let hours = (ti / 3600)
        
        var returnString:String = __designTimeString("#47291.[1].[3].[3].value", fallback: "")
            
        if(Int(hours) >= 1){
           returnString = String(format: "%d時間 %02d分",hours,minutes)
        }else{
            returnString = String(format: "%02d分",minutes)
        }

        return __designTimeSelection(returnString, "#47291.[1].[3].[5]")
    #sourceLocation()
    }
}

extension WorkoutView {
    @_dynamicReplacement(for: calcAverageSpeedForMeter(interval:distance:)) private func __preview__calcAverageSpeedForMeter(interval: TimeInterval, distance: Double) -> String {
        #sourceLocation(file: "/Users/nokkun/Documents/WalkCounter/WalkCounter/WorkoutView.swift", line: 81)
            let ti = NSInteger(__designTimeSelection(interval, "#47291.[1].[2].[0].value.arg[0].value"))
            let total_seconds = Int(Double(ti) / distance)
            let seconds = total_seconds % 60
            let minutes = (total_seconds / 60) % 60

            return __designTimeSelection(String(format: __designTimeString("#47291.[1].[2].[4].arg[0].value", fallback: "%d.%0.2d"),__designTimeSelection(minutes, "#47291.[1].[2].[4].arg[1].value"),__designTimeSelection(seconds, "#47291.[1].[2].[4].arg[2].value")), "#47291.[1].[2].[4]")
        #sourceLocation()
    }
}

extension WorkoutView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/nokkun/Documents/WalkCounter/WalkCounter/WorkoutView.swift", line: 14)
        
        if let workouts = hkmanager.getWorkout(){
            __designTimeSelection(ScrollView {
                __designTimeSelection(LazyVStack{
                    if let time = hkmanager.lastupdateWorkout?.DateToStringFormatter(format: "yyyy-MM-dd HH:mm:ss"){
                        __designTimeSelection(Text("LastUpdate:" + time)
                            .font(.footnote), "#47291.[1].[1].property.[0].[0].[0].[0].arg[0].value.[0].arg[0].value.[0].[0].[0]")
                    }else{
                        __designTimeSelection(Text(__designTimeString("#47291.[1].[1].property.[0].[0].[0].[0].arg[0].value.[0].arg[0].value.[0].[1].[0].arg[0].value", fallback: "LastUpdate"))
                            .font(.footnote), "#47291.[1].[1].property.[0].[0].[0].[0].arg[0].value.[0].arg[0].value.[0].[1].[0]")
                    }
                    __designTimeSelection(ForEach(0..<workouts.count){ idx in
                        __designTimeSelection(GroupBox(
                            label: __designTimeSelection(Text(__designTimeString("#47291.[1].[1].property.[0].[0].[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[0].arg[0].value.arg[0].value", fallback: "🏃‍♂️ランニング")), "#47291.[1].[1].property.[0].[0].[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[0].arg[0].value")
                        ) {
                            let i = workouts.count - 1 - idx
                            let rev = workouts[__designTimeSelection(i, "#47291.[1].[1].property.[0].[0].[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[0].arg[1].value.[1].value.[0].value")]
                            __designTimeSelection(Text(__designTimeSelection(rev.startTime.DateToStringFormatter(format: __designTimeString("#47291.[1].[1].property.[0].[0].[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[0].arg[1].value.[2].arg[0].value.arg[0].value", fallback: "y年M月d日(E)")), "#47291.[1].[1].property.[0].[0].[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[0].arg[1].value.[2].arg[0].value"))
                                .font(.title), "#47291.[1].[1].property.[0].[0].[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[0].arg[1].value.[2]")
                            
                            __designTimeSelection(HStack {
                                __designTimeSelection(Text(__designTimeString("#47291.[1].[1].property.[0].[0].[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[0].arg[1].value.[3].arg[0].value.[0].arg[0].value", fallback: "時間"))
                                    .font(.footnote), "#47291.[1].[1].property.[0].[0].[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[0].arg[1].value.[3].arg[0].value.[0]")
                                __designTimeSelection(Text("🕒 " + stringFromTimeInterval(interval: rev.interval))
                                    .font(.title), "#47291.[1].[1].property.[0].[0].[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[0].arg[1].value.[3].arg[0].value.[1]")
                                let period = rev.startTime.DateToStringFormatter(format: "HH:mm") + "~" +
                                    rev.endTime.DateToStringFormatter(format: "HH:mm")
                                
                                __designTimeSelection(Text("(" + period + ")")
                                    .font(.footnote), "#47291.[1].[1].property.[0].[0].[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[0].arg[1].value.[3].arg[0].value.[3]")
                            }, "#47291.[1].[1].property.[0].[0].[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[0].arg[1].value.[3]")
                            
                            __designTimeSelection(HStack{
                                __designTimeSelection(Text(__designTimeString("#47291.[1].[1].property.[0].[0].[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[0].arg[1].value.[4].arg[0].value.[0].arg[0].value", fallback: "距離"))
                                    .font(.footnote), "#47291.[1].[1].property.[0].[0].[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[0].arg[1].value.[4].arg[0].value.[0]")
                                __designTimeSelection(Text("🛣 " + String(rev.distance))
                                    .font(.title), "#47291.[1].[1].property.[0].[0].[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[0].arg[1].value.[4].arg[0].value.[1]")
                                __designTimeSelection(Text(__designTimeString("#47291.[1].[1].property.[0].[0].[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[0].arg[1].value.[4].arg[0].value.[2].arg[0].value", fallback: "km"))
                                    .font(.footnote), "#47291.[1].[1].property.[0].[0].[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[0].arg[1].value.[4].arg[0].value.[2]")
                            }, "#47291.[1].[1].property.[0].[0].[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[0].arg[1].value.[4]")
                         
                            __designTimeSelection(HStack{
                                __designTimeSelection(Text(__designTimeString("#47291.[1].[1].property.[0].[0].[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[0].arg[1].value.[5].arg[0].value.[0].arg[0].value", fallback: "平均ペース"))
                                    .font(.footnote), "#47291.[1].[1].property.[0].[0].[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[0].arg[1].value.[5].arg[0].value.[0]")
                                __designTimeSelection(Text("🏃‍♂️ " + calcAverageSpeedForMeter(interval: rev.interval, distance: rev.distance))
                                    .font(.title), "#47291.[1].[1].property.[0].[0].[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[0].arg[1].value.[5].arg[0].value.[1]")
                                __designTimeSelection(Text(__designTimeString("#47291.[1].[1].property.[0].[0].[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[0].arg[1].value.[5].arg[0].value.[2].arg[0].value", fallback: "分 / km"))
                                    .font(.footnote), "#47291.[1].[1].property.[0].[0].[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[0].arg[1].value.[5].arg[0].value.[2]")
                            }, "#47291.[1].[1].property.[0].[0].[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[0].arg[1].value.[5]")
                            
                            __designTimeSelection(HStack{
                                __designTimeSelection(Text(__designTimeString("#47291.[1].[1].property.[0].[0].[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[0].arg[1].value.[6].arg[0].value.[0].arg[0].value", fallback: "消費カロリー"))
                                    .font(.footnote), "#47291.[1].[1].property.[0].[0].[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[0].arg[1].value.[6].arg[0].value.[0]")
                                __designTimeSelection(Text("🔥 " + String(rev.energyBurned))
                                    .font(.title), "#47291.[1].[1].property.[0].[0].[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[0].arg[1].value.[6].arg[0].value.[1]")
                                __designTimeSelection(Text(__designTimeString("#47291.[1].[1].property.[0].[0].[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[0].arg[1].value.[6].arg[0].value.[2].arg[0].value", fallback: "キロカロリー"))
                                    .font(.footnote), "#47291.[1].[1].property.[0].[0].[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[0].arg[1].value.[6].arg[0].value.[2]")
                            }, "#47291.[1].[1].property.[0].[0].[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[0].arg[1].value.[6]")
                        }.padding(), "#47291.[1].[1].property.[0].[0].[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[0]")
                    }, "#47291.[1].[1].property.[0].[0].[0].[0].arg[0].value.[0].arg[0].value.[1]")
                }, "#47291.[1].[1].property.[0].[0].[0].[0].arg[0].value.[0]")
            }, "#47291.[1].[1].property.[0].[0].[0].[0]")
        }else{
            __designTimeSelection(Text(__designTimeString("#47291.[1].[1].property.[0].[0].[1].[0].arg[0].value", fallback: "No Workout...")), "#47291.[1].[1].property.[0].[0].[1].[0]")
        }
    #sourceLocation()
    }
}

import struct WalkCounter.WorkoutView
import struct WalkCounter.WorkoutView_Previews