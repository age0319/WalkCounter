@_private(sourceFile: "RankingView.swift") import WalkCounter
import SwiftUI
import SwiftUI

extension RankingView_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/nokkun/Documents/WalkCounter/WalkCounter/RankingView.swift", line: 40)
        AnyView(__designTimeSelection(RankingView(hkmanager: __designTimeSelection(HKManager(), "#5522.[2].[0].property.[0].[0].arg[0].value"))
            .preferredColorScheme(.dark), "#5522.[2].[0].property.[0].[0]"))
    #sourceLocation()
    }
}

extension RankingView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/nokkun/Documents/WalkCounter/WalkCounter/RankingView.swift", line: 14)
        
        AnyView(__designTimeSelection(VStack{
            __designTimeSelection(Text(__designTimeString("#5522.[1].[1].property.[0].[0].arg[0].value.[0].arg[0].value", fallback: "ランキング"))
                .font(.largeTitle), "#5522.[1].[1].property.[0].[0].arg[0].value.[0]")

            if let rank = hkmanager.getRanking(){
                let medals = [__designTimeString("#5522.[1].[1].property.[0].[0].arg[0].value.[1].[0].[0].value.[0]", fallback: "🥇"),__designTimeString("#5522.[1].[1].property.[0].[0].arg[0].value.[1].[0].[0].value.[1]", fallback: "🥈"),__designTimeString("#5522.[1].[1].property.[0].[0].arg[0].value.[1].[0].[0].value.[2]", fallback: "🥉")]
                __designTimeSelection(List(0..<rank.count) { idx in
                    __designTimeSelection(HStack{
                        if(idx < 3){
                            __designTimeSelection(Text(__designTimeSelection(medals[__designTimeSelection(idx, "#5522.[1].[1].property.[0].[0].arg[0].value.[1].[0].[1].arg[1].value.[0].arg[0].value.[0].[0].[0].arg[0].value.[0].value")], "#5522.[1].[1].property.[0].[0].arg[0].value.[1].[0].[1].arg[1].value.[0].arg[0].value.[0].[0].[0].arg[0].value")), "#5522.[1].[1].property.[0].[0].arg[0].value.[1].[0].[1].arg[1].value.[0].arg[0].value.[0].[0].[0]")
                        }else{
                            __designTimeSelection(Text(__designTimeString("#5522.[1].[1].property.[0].[0].arg[0].value.[1].[0].[1].arg[1].value.[0].arg[0].value.[0].[1].[0].arg[0].value", fallback: "👏")), "#5522.[1].[1].property.[0].[0].arg[0].value.[1].[0].[1].arg[1].value.[0].arg[0].value.[0].[1].[0]")
                        }
                        __designTimeSelection(Text(rank[idx].day.DateToStringFormatter(format: __designTimeString("#5522.[1].[1].property.[0].[0].arg[0].value.[1].[0].[1].arg[1].value.[0].arg[0].value.[1].arg[0].value.arg[0].value", fallback: "yyyy年M月d日(E)"))), "#5522.[1].[1].property.[0].[0].arg[0].value.[1].[0].[1].arg[1].value.[0].arg[0].value.[1]")
                        __designTimeSelection(Text(__designTimeSelection(String(rank[idx].step), "#5522.[1].[1].property.[0].[0].arg[0].value.[1].[0].[1].arg[1].value.[0].arg[0].value.[2].arg[0].value"))
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/), "#5522.[1].[1].property.[0].[0].arg[0].value.[1].[0].[1].arg[1].value.[0].arg[0].value.[2]")
                        __designTimeSelection(Text(__designTimeString("#5522.[1].[1].property.[0].[0].arg[0].value.[1].[0].[1].arg[1].value.[0].arg[0].value.[3].arg[0].value", fallback: "step")), "#5522.[1].[1].property.[0].[0].arg[0].value.[1].[0].[1].arg[1].value.[0].arg[0].value.[3]")
                    }, "#5522.[1].[1].property.[0].[0].arg[0].value.[1].[0].[1].arg[1].value.[0]")
                }, "#5522.[1].[1].property.[0].[0].arg[0].value.[1].[0].[1]")
            }
        }, "#5522.[1].[1].property.[0].[0]"))
    #sourceLocation()
    }
}

import struct WalkCounter.RankingView
import struct WalkCounter.RankingView_Previews