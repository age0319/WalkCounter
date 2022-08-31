@_private(sourceFile: "ContentView.swift") import WalkCounter
import HealthKit
import SwiftUI
import SwiftUI

extension ContentView_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/nokkun/Documents/WalkCounter/WalkCounter/ContentView.swift", line: 41)
        AnyView(__designTimeSelection(ContentView()
            .preferredColorScheme(.dark), "#4207.[3].[0].property.[0].[0]"))
    #sourceLocation()
    }
}

extension ContentView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/nokkun/Documents/WalkCounter/WalkCounter/ContentView.swift", line: 14)
        AnyView(__designTimeSelection(TabView {
            __designTimeSelection(CalendarView(hkmanager: __designTimeSelection(hkmanager, "#4207.[2].[1].property.[0].[0].arg[0].value.[0].arg[0].value")).tabItem {
                __designTimeSelection(Image(systemName: __designTimeString("#4207.[2].[1].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value.[0].arg[0].value", fallback: "calendar")), "#4207.[2].[1].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value.[0]")
                __designTimeSelection(Text(__designTimeString("#4207.[2].[1].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value.[1].arg[0].value", fallback: "カレンダー")), "#4207.[2].[1].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value.[1]")
            }.tag(__designTimeInteger("#4207.[2].[1].property.[0].[0].arg[0].value.[0].modifier[1].arg[0].value", fallback: 1)), "#4207.[2].[1].property.[0].[0].arg[0].value.[0]")
            
            __designTimeSelection(RankingView(hkmanager: __designTimeSelection(hkmanager, "#4207.[2].[1].property.[0].[0].arg[0].value.[1].arg[0].value")).tabItem {
                __designTimeSelection(Image(systemName: __designTimeString("#4207.[2].[1].property.[0].[0].arg[0].value.[1].modifier[0].arg[0].value.[0].arg[0].value", fallback: "chart.bar")), "#4207.[2].[1].property.[0].[0].arg[0].value.[1].modifier[0].arg[0].value.[0]")
                __designTimeSelection(Text(__designTimeString("#4207.[2].[1].property.[0].[0].arg[0].value.[1].modifier[0].arg[0].value.[1].arg[0].value", fallback: "ランキング")), "#4207.[2].[1].property.[0].[0].arg[0].value.[1].modifier[0].arg[0].value.[1]")
            }.tag(__designTimeInteger("#4207.[2].[1].property.[0].[0].arg[0].value.[1].modifier[1].arg[0].value", fallback: 2)), "#4207.[2].[1].property.[0].[0].arg[0].value.[1]")
            
            __designTimeSelection(WorkoutView(hkmanager: __designTimeSelection(hkmanager, "#4207.[2].[1].property.[0].[0].arg[0].value.[2].arg[0].value")).tabItem {
                __designTimeSelection(Image(systemName: __designTimeString("#4207.[2].[1].property.[0].[0].arg[0].value.[2].modifier[0].arg[0].value.[0].arg[0].value", fallback: "figure.walk")), "#4207.[2].[1].property.[0].[0].arg[0].value.[2].modifier[0].arg[0].value.[0]")
                __designTimeSelection(Text(__designTimeString("#4207.[2].[1].property.[0].[0].arg[0].value.[2].modifier[0].arg[0].value.[1].arg[0].value", fallback: "ランニング")), "#4207.[2].[1].property.[0].[0].arg[0].value.[2].modifier[0].arg[0].value.[1]")
            }.tag(__designTimeInteger("#4207.[2].[1].property.[0].[0].arg[0].value.[2].modifier[1].arg[0].value", fallback: 3)), "#4207.[2].[1].property.[0].[0].arg[0].value.[2]")
            
            __designTimeSelection(SettingView(hkmanager: __designTimeSelection(hkmanager, "#4207.[2].[1].property.[0].[0].arg[0].value.[3].arg[0].value")).tabItem {
                __designTimeSelection(Image(systemName: __designTimeString("#4207.[2].[1].property.[0].[0].arg[0].value.[3].modifier[0].arg[0].value.[0].arg[0].value", fallback: "person.circle")), "#4207.[2].[1].property.[0].[0].arg[0].value.[3].modifier[0].arg[0].value.[0]")
                __designTimeSelection(Text(__designTimeString("#4207.[2].[1].property.[0].[0].arg[0].value.[3].modifier[0].arg[0].value.[1].arg[0].value", fallback: "設定")), "#4207.[2].[1].property.[0].[0].arg[0].value.[3].modifier[0].arg[0].value.[1]")
            }.tag(__designTimeInteger("#4207.[2].[1].property.[0].[0].arg[0].value.[3].modifier[1].arg[0].value", fallback: 4)), "#4207.[2].[1].property.[0].[0].arg[0].value.[3]")
            
        }, "#4207.[2].[1].property.[0].[0]"))
    #sourceLocation()
    }
}

import struct WalkCounter.ContentView
import struct WalkCounter.ContentView_Previews