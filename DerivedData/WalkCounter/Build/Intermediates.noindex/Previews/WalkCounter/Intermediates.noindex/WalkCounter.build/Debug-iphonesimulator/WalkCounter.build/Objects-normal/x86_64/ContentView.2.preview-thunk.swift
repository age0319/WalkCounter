@_private(sourceFile: "ContentView.swift") import WalkCounter
import HealthKit
import SwiftUI
import SwiftUI

extension ContentView_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/nokkun/Documents/WalkCounter/WalkCounter/ContentView.swift", line: 41)
        AnyView(ContentView()
            .preferredColorScheme(.dark))
    #sourceLocation()
    }
}

extension ContentView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/nokkun/Documents/WalkCounter/WalkCounter/ContentView.swift", line: 14)
        AnyView(TabView {
            CalendarView(hkmanager: hkmanager).tabItem {
                Image(systemName: __designTimeString("#4207.[2].[1].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value.[0].arg[0].value", fallback: "calendar"))
                Text(__designTimeString("#4207.[2].[1].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value.[1].arg[0].value", fallback: "カレンダー"))
            }.tag(__designTimeInteger("#4207.[2].[1].property.[0].[0].arg[0].value.[0].modifier[1].arg[0].value", fallback: 1))
            
            RankingView(hkmanager: hkmanager).tabItem {
                Image(systemName: __designTimeString("#4207.[2].[1].property.[0].[0].arg[0].value.[1].modifier[0].arg[0].value.[0].arg[0].value", fallback: "chart.bar"))
                Text(__designTimeString("#4207.[2].[1].property.[0].[0].arg[0].value.[1].modifier[0].arg[0].value.[1].arg[0].value", fallback: "ランキング"))
            }.tag(__designTimeInteger("#4207.[2].[1].property.[0].[0].arg[0].value.[1].modifier[1].arg[0].value", fallback: 2))
            
            WorkoutView(hkmanager: hkmanager).tabItem {
                Image(systemName: __designTimeString("#4207.[2].[1].property.[0].[0].arg[0].value.[2].modifier[0].arg[0].value.[0].arg[0].value", fallback: "figure.walk"))
                Text(__designTimeString("#4207.[2].[1].property.[0].[0].arg[0].value.[2].modifier[0].arg[0].value.[1].arg[0].value", fallback: "ランニング"))
            }.tag(__designTimeInteger("#4207.[2].[1].property.[0].[0].arg[0].value.[2].modifier[1].arg[0].value", fallback: 3))
            
            SettingView(hkmanager: hkmanager).tabItem {
                Image(systemName: __designTimeString("#4207.[2].[1].property.[0].[0].arg[0].value.[3].modifier[0].arg[0].value.[0].arg[0].value", fallback: "person.circle"))
                Text(__designTimeString("#4207.[2].[1].property.[0].[0].arg[0].value.[3].modifier[0].arg[0].value.[1].arg[0].value", fallback: "設定"))
            }.tag(__designTimeInteger("#4207.[2].[1].property.[0].[0].arg[0].value.[3].modifier[1].arg[0].value", fallback: 4))
            
        })
    #sourceLocation()
    }
}

import struct WalkCounter.ContentView
import struct WalkCounter.ContentView_Previews