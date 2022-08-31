//
//  HKManager.swift
//  WalkCounter
//
//  Created by nokkun on 2021/11/14.
//

import Foundation
import HealthKit
import SwiftUI

class HKManager: ObservableObject{
    //クラスの外でも使う変数
    @Published var isStepLoading:Bool = false
    @Published var isWorkoutLoading:Bool = false
    @Published var StepData = [Date: Int]()
    @Published var lastupdate:Date?
    @Published var lastupdateWorkout:Date?
    @Published var workoutRecord = [WorkOutRecord]()
    @Published var RunningDict = [String:Bool]()
    
    //設定値
    @Published var target:Int {
        didSet{
            UserDefaults.standard.set(target,forKey: "target")
        }
    }
    
    //クラス内でのみ使う変数
    let healthStore = HKHealthStore()
    var LoadingStartYear:Int = 2007
    
    init() {
        
        target = UserDefaults.standard.object(forKey: "target") as? Int ?? 7000
                
        if isPreview(){
            setSampleData()
        }else{
            
            if !HKHealthStore.isHealthDataAvailable(){
                print("can't get health data...Maybe Ipad..")
                self.setSampleData()
                return
            }
            
            let readType = Set(
                [HKObjectType.quantityType(forIdentifier: .stepCount)!,
                 HKWorkoutType.workoutType()])
            
            healthStore.requestAuthorization(toShare: nil, read: readType, completion: { success, error in
                if success{                    
                    #if targetEnvironment(simulator)
                    // iOS simulator code
                    self.setSampleData()
                    #else
                    self.getIntervalSteps()
                    self.startObserving()
                    #endif
                }
            })

        }
                
    }
    
    func setSampleData() {
        //歩数データの作成
        
        DispatchQueue.main.async {

            let days = Date().changeMonth(i: -1).getAllDays()
            
            for d in days {
                let v = Int.random(in: 500...15000)
                self.StepData[d] = v
            }
            
            //ランニングデータの作成
            let start1 = Calendar.current.date(from: DateComponents(year:2021,month: 11,day: 1,hour: 13,minute: 5,second: 31))!
            let end1 = Calendar.current.date(from: DateComponents(year:2021,month: 11,day: 1,hour: 13,minute: 25,second: 31))!
            
            self.workoutRecord.append(WorkOutRecord(startTime: start1,
                                                    endTime: end1,
                                                    distance: 3.11,
                                                    energyBurned: 200,
                                                    interval: 20 * 60))
            
            let start1String = start1.DateToStringFormatter(format:"yyyy-MM-dd")
            self.RunningDict[start1String] = true
            
            let start2 = Calendar.current.date(from: DateComponents(year:2021,month: 11,day: 4,hour: 14,minute: 5,second: 31))!
            let end2 = Calendar.current.date(from: DateComponents(year:2021,month: 11,day: 4,hour: 14,minute: 35,second: 31))!
            
            let start2String = start2.DateToStringFormatter(format:"yyyy-MM-dd")
            
            self.workoutRecord.append(WorkOutRecord(startTime: start2,
                                                    endTime: end2,
                                                    distance: 4.11,
                                                    energyBurned: 300,
                                                    interval: 30 * 60))
            self.RunningDict[start2String] = true
            
        }
    }
    
    func getMonthTotalStep(diff:Int) -> Int?{
        
        if StepData.isEmpty { return nil }
        
        let days = Date().changeMonth(i: diff).getAllDays()
        
        var monthTotal:Int = 0
        for i in days{
            
            if let step = StepData[i]{
                monthTotal += step
            }
        }
        
        return monthTotal
    }
    
    func  getRunningTotal(diff:Int)  ->  Int?{
       
        if RunningDict.isEmpty { return nil }
        
        let days = Date().changeMonth(i: diff).getAllDays()
        
        var monthTotal:Int = 0
        for i in days{
            let key = i.DateToStringFormatter(format: "yyyy-MM-dd")
            
            if let _ = RunningDict[key]{
                monthTotal += 1
            }
        }
        
        return monthTotal
    }
        
    func isPreview() -> Bool {
        return ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
    }
    
    func check() -> Bool{
        self.workoutRecord.isEmpty || self.isWorkoutLoading == true
    }
    
    func getWorkout() -> [WorkOutRecord]? {
        if(self.check()){ return nil }
        
        return workoutRecord    
    }
    
    func getRanking() ->  [Rank]? {
        
        if(StepData.isEmpty || isStepLoading){ return nil }
        
        let sorted = StepData.sorted { $0.value > $1.value }.prefix(10)
        var rank:[Rank] = []
        for i in sorted {
            rank.append(Rank(day: i.key, step: i.value))
        }
        
        return rank
    }

    let workouttype = HKWorkoutType.workoutType()
    
    func startObserving() {
                
        let observerQuery = HKObserverQuery(sampleType: workouttype,
                                        predicate: nil,
                                        updateHandler: { _, _, error in
                                            if error != nil { return }
                                            self.readWorkOut()
                                        })
        healthStore.execute(observerQuery)
    }
    
    func readWorkOut(){
        
        let sampleQuery = HKSampleQuery(sampleType: workouttype,
                                        predicate: nil,
                                        limit: 0,
                                        sortDescriptors: [NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)], //新しい順に並べる
                                        resultsHandler: {(_,sample,error) in
                                            if error != nil { return }
                                            self.recordWorkout(sample: sample as? [HKWorkout])
                                        })
        healthStore.execute(sampleQuery)
    }
    
    func recordWorkout(sample:[HKWorkout]?) {
        
        DispatchQueue.main.async {
            self.workoutRecord = []
            self.isWorkoutLoading = true
        }
        
        if let workouts = sample{
            
            for workout in workouts{
                //ランニングに限定する
                if (workout.workoutActivityType == .running) {
                    
                    guard let distance = workout.totalDistance else { return }
                    guard let energy = workout.totalEnergyBurned else { return }
                    
                    let distanceFormatted = (distance.doubleValue(for: HKUnit.meterUnit(with: .kilo)) * 100).rounded() / 100
                    let energyInt = Int(energy.doubleValue(for: HKUnit.kilocalorie()).rounded())
                    
                    let row = WorkOutRecord(startTime: workout.startDate,
                                                endTime: workout.endDate,
                                                distance: distanceFormatted,
                                                energyBurned: energyInt, interval: workout.duration)
                    DispatchQueue.main.async {
                        self.workoutRecord.append(row)
                        
                        let dateString = workout.startDate.DateToStringFormatter(format:"yyyy-MM-dd")
                        self.RunningDict[dateString] = true
                    }
                }
            }
        }
        
        DispatchQueue.main.async {
            self.isWorkoutLoading = false
            self.lastupdateWorkout = Date()
        }
        
    }
    
    func getIntervalSteps(){
                
        guard let start = Calendar.current.date(from: DateComponents(year:LoadingStartYear)) else {
            return
        }
        
        //初期化
        DispatchQueue.main.async {
            self.isStepLoading = true
        }
        
        guard let type = HKQuantityType.quantityType(forIdentifier: .stepCount) else {
            return
        }
        
        let interval = DateComponents(day:1)
        
        let query = HKStatisticsCollectionQuery(quantityType: type, quantitySamplePredicate: nil, options: .cumulativeSum, anchorDate: start, intervalComponents: interval)
        
        
        query.initialResultsHandler = { _, result, error in
            
            if error != nil {
                //  Something went Wrong
                return
            }
            
            guard let result = result else { return }
                        
            let end = Date()
            
            result.enumerateStatistics(from: start, to: end, with: { stats, _ in
                
                if let step = stats.sumQuantity()?.doubleValue(for: HKUnit.count()){
                    
                    DispatchQueue.main.async {
                        self.StepData[stats.startDate] = Int(step)
                    }
                }
                
            })
            
            DispatchQueue.main.async {
                self.isStepLoading = false
                self.lastupdate = end
            }
        }
        
        query.statisticsUpdateHandler = {_,_,result,error in
            
            if error != nil {
                //  Something went Wrong
                return
            }
            
            guard let result = result else { return }
            
            let end = Date()
            
            if let last = self.lastupdate{
                
                result.enumerateStatistics(from: last, to: end, with: { stats, _ in
                    if let step = stats.sumQuantity()?.doubleValue(for: HKUnit.count()){
                        
                        DispatchQueue.main.async {
                            self.StepData[stats.startDate] = Int(step)
                            self.lastupdate = end
                        }
                    }
                })
            }
            
        }
        
        healthStore.execute(query)
    }
    
}

class Rank:Identifiable{
    var id = UUID()
    var day:Date
    var step:Int
    
    init(day:Date,step:Int) {
        self.day = day
        self.step = step
    }
}

struct WorkOutRecord:Identifiable {
    var id = UUID()
    var startTime:Date
    var endTime:Date
    var distance:Double
    var energyBurned:Int
    var interval:TimeInterval
}

