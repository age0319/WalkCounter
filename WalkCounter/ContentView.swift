//
//  ContentView.swift
//  WalkCounter
//
//  Created by nokkun on 2021/11/10.
//

import SwiftUI
import HealthKit

struct ContentView: View {
    @StateObject var hkmanager = HKManager()
    var body: some View {
        TabView {
            CalendarView(hkmanager: hkmanager).tabItem {
                Image(systemName: "calendar")
                Text("カレンダー")
            }.tag(1)
            
            RankingView(hkmanager: hkmanager).tabItem {
                Image(systemName: "chart.bar")
                Text("ランキング")
            }.tag(2)
            
            WorkoutView(hkmanager: hkmanager).tabItem {
                Image(systemName: "figure.walk")
                Text("ランニング")
            }.tag(3)
            
            SettingView(hkmanager: hkmanager).tabItem {
                Image(systemName: "person.circle")
                Text("設定")
            }.tag(4)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
