@_private(sourceFile: "WorkoutView.swift") import WalkCounter
import SwiftUI
import SwiftUI

extension WorkoutView_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/nokkun/Documents/WalkCounter/WalkCounter/WorkoutView.swift", line: 110)
        AnyView(WorkoutView(hkmanager: HKManager())
            .preferredColorScheme(.dark))
    #sourceLocation()
    }
}

extension WorkoutView {
    @_dynamicReplacement(for: stringFromTimeInterval(interval:)) private func __preview__stringFromTimeInterval(interval: TimeInterval) -> String {
        #sourceLocation(file: "/Users/nokkun/Documents/WalkCounter/WalkCounter/WorkoutView.swift", line: 91)
        
        let ti = NSInteger(interval)
//        let seconds = ti % 60
        let minutes = (ti / 60) % 60
        let hours = (ti / 3600)
        
        var returnString:String = __designTimeString("#47291.[1].[3].[3].value", fallback: "")
            
        if(Int(hours) >= 1){
           returnString = String(format: "%d時間 %02d分",hours,minutes)
        }else{
            returnString = String(format: "%02d分",minutes)
        }

        return returnString
    #sourceLocation()
    }
}

extension WorkoutView {
    @_dynamicReplacement(for: calcAverageSpeedForMeter(interval:distance:)) private func __preview__calcAverageSpeedForMeter(interval: TimeInterval, distance: Double) -> String {
        #sourceLocation(file: "/Users/nokkun/Documents/WalkCounter/WalkCounter/WorkoutView.swift", line: 81)
            let ti = NSInteger(interval)
            let total_seconds = Int(Double(ti) / distance)
            let seconds = total_seconds % 60
            let minutes = (total_seconds / 60) % 60

            return String(format: __designTimeString("#47291.[1].[2].[4].arg[0].value", fallback: "%d.%0.2d"),minutes,seconds)
        #sourceLocation()
    }
}

extension WorkoutView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/nokkun/Documents/WalkCounter/WalkCounter/WorkoutView.swift", line: 14)
        
        if let workouts = hkmanager.getWorkout(){
            ScrollView {
                LazyVStack{
                    if let time = hkmanager.lastupdateWorkout?.DateToStringFormatter(format: "yyyy-MM-dd HH:mm:ss"){
                        Text("LastUpdate:" + time)
                            .font(.footnote)
                    }else{
                        Text(__designTimeString("#47291.[1].[1].property.[0].[0].[0].[0].arg[0].value.[0].arg[0].value.[0].[1].[0].arg[0].value", fallback: "LastUpdate"))
                            .font(.footnote)
                    }
                    ForEach(0..<workouts.count){ idx in
                        GroupBox(
                            label: Text(__designTimeString("#47291.[1].[1].property.[0].[0].[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[0].arg[0].value.arg[0].value", fallback: "🏃‍♂️ランニング"))
                        ) {
                            let i = workouts.count - 1 - idx
                            let rev = workouts[i]
                            Text(rev.startTime.DateToStringFormatter(format: __designTimeString("#47291.[1].[1].property.[0].[0].[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[0].arg[1].value.[2].arg[0].value.arg[0].value", fallback: "y年M月d日(E)")))
                                .font(.title)
                            
                            HStack {
                                Text(__designTimeString("#47291.[1].[1].property.[0].[0].[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[0].arg[1].value.[3].arg[0].value.[0].arg[0].value", fallback: "時間"))
                                    .font(.footnote)
                                Text("🕒 " + stringFromTimeInterval(interval: rev.interval))
                                    .font(.title)
                                let period = rev.startTime.DateToStringFormatter(format: "HH:mm") + "~" +
                                    rev.endTime.DateToStringFormatter(format: "HH:mm")
                                
                                Text("(" + period + ")")
                                    .font(.footnote)
                            }
                            
                            HStack{
                                Text(__designTimeString("#47291.[1].[1].property.[0].[0].[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[0].arg[1].value.[4].arg[0].value.[0].arg[0].value", fallback: "距離"))
                                    .font(.footnote)
                                Text("🛣 " + String(rev.distance))
                                    .font(.title)
                                Text(__designTimeString("#47291.[1].[1].property.[0].[0].[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[0].arg[1].value.[4].arg[0].value.[2].arg[0].value", fallback: "km"))
                                    .font(.footnote)
                            }
                         
                            HStack{
                                Text(__designTimeString("#47291.[1].[1].property.[0].[0].[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[0].arg[1].value.[5].arg[0].value.[0].arg[0].value", fallback: "平均ペース"))
                                    .font(.footnote)
                                Text("🏃‍♂️ " + calcAverageSpeedForMeter(interval: rev.interval, distance: rev.distance))
                                    .font(.title)
                                Text(__designTimeString("#47291.[1].[1].property.[0].[0].[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[0].arg[1].value.[5].arg[0].value.[2].arg[0].value", fallback: "分 / km"))
                                    .font(.footnote)
                            }
                            
                            HStack{
                                Text(__designTimeString("#47291.[1].[1].property.[0].[0].[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[0].arg[1].value.[6].arg[0].value.[0].arg[0].value", fallback: "消費カロリー"))
                                    .font(.footnote)
                                Text("🔥 " + String(rev.energyBurned))
                                    .font(.title)
                                Text(__designTimeString("#47291.[1].[1].property.[0].[0].[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[0].arg[1].value.[6].arg[0].value.[2].arg[0].value", fallback: "キロカロリー"))
                                    .font(.footnote)
                            }
                        }.padding()
                    }
                }
            }
        }else{
            Text(__designTimeString("#47291.[1].[1].property.[0].[0].[1].[0].arg[0].value", fallback: "No Workout..."))
        }
    #sourceLocation()
    }
}

import struct WalkCounter.WorkoutView
import struct WalkCounter.WorkoutView_Previews