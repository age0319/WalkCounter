//
//  WorkoutView.swift
//  WalkCounter
//
//  Created by nokkun on 2021/11/24.
//

import SwiftUI

struct WorkoutView: View {
    @StateObject var hkmanager:HKManager
    var body: some View {
        
        if let workouts = hkmanager.getWorkout(){
            ScrollView {
                LazyVStack{
                    if let time = hkmanager.lastupdateWorkout?.DateToStringFormatter(format: "yyyy-MM-dd HH:mm:ss"){
                        Text("LastUpdate:" + time)
                            .font(.footnote)
                    }else{
                        Text("No Update")
                            .font(.footnote)
                    }
                    
                    ForEach(0..<workouts.count){ idx in
                        GroupBox(
                            label: Text("๐โโ๏ธใฉใณใใณใฐ")
                        ) {
                            let rev = workouts[idx]
                            Text(rev.startTime.DateToStringFormatter(format: "yๅนดMๆdๆฅ(E)"))
                                .font(.title)
                            
                            HStack {
                                Text("ๆ้")
                                    .font(.footnote)
                                Text("๐ " + stringFromTimeInterval(interval: rev.interval))
                                    .font(.title)
                                let period = rev.startTime.DateToStringFormatter(format: "HH:mm") + "~" +
                                    rev.endTime.DateToStringFormatter(format: "HH:mm")
                                
                                Text("(" + period + ")")
                                    .font(.footnote)
                            }
                            
                            HStack{
                                Text("่ท้ข")
                                    .font(.footnote)
                                Text("๐ฃ " + String(rev.distance))
                                    .font(.title)
                                Text("km")
                                    .font(.footnote)
                            }
                         
                            HStack{
                                Text("ๅนณๅใใผใน")
                                    .font(.footnote)
                                Text("๐โโ๏ธ " + calcAverageSpeedForMeter(interval: rev.interval, distance: rev.distance))
                                    .font(.title)
                                Text("ๅ / km")
                                    .font(.footnote)
                            }
                            
                            HStack{
                                Text("ๆถ่ฒปใซใญใชใผ")
                                    .font(.footnote)
                                Text("๐ฅ " + String(rev.energyBurned))
                                    .font(.title)
                                Text("ใญใญใซใญใชใผ")
                                    .font(.footnote)
                            }
                        }.padding()
                    }
                }
            }
        }else{
            Text("No Workout...")
        }
    }
    
    func calcAverageSpeedForMeter(interval: TimeInterval, distance: Double) -> String {
            let ti = NSInteger(interval)
            let total_seconds = Int(Double(ti) / distance)
            let seconds = total_seconds % 60
            let minutes = (total_seconds / 60) % 60

            return String(format: "%d.%0.2d",minutes,seconds)
        }
    
    func stringFromTimeInterval(interval: TimeInterval) -> String {
        
        let ti = NSInteger(interval)
//        let seconds = ti % 60
        let minutes = (ti / 60) % 60
        let hours = (ti / 3600)
        
        var returnString:String = ""
            
        if(Int(hours) >= 1){
           returnString = String(format: "%dๆ้ %02dๅ",hours,minutes)
        }else{
            returnString = String(format: "%02dๅ",minutes)
        }

        return returnString
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView(hkmanager: HKManager())
            .preferredColorScheme(.dark)
    }
}
