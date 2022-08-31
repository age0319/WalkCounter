@_private(sourceFile: "RankingView.swift") import WalkCounter
import SwiftUI
import SwiftUI

extension RankingView_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/nokkun/Documents/WalkCounter/WalkCounter/RankingView.swift", line: 40)
        AnyView(RankingView(hkmanager: HKManager())
            .preferredColorScheme(.dark))
    #sourceLocation()
    }
}

extension RankingView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/nokkun/Documents/WalkCounter/WalkCounter/RankingView.swift", line: 14)
        
        AnyView(VStack{
            Text(__designTimeString("#5522.[1].[1].property.[0].[0].arg[0].value.[0].arg[0].value", fallback: "ランキング"))
                .font(.largeTitle)

            if let rank = hkmanager.getRanking(){
                let medals = [__designTimeString("#5522.[1].[1].property.[0].[0].arg[0].value.[1].[0].[0].value.[0]", fallback: "🥇"),__designTimeString("#5522.[1].[1].property.[0].[0].arg[0].value.[1].[0].[0].value.[1]", fallback: "🥈"),__designTimeString("#5522.[1].[1].property.[0].[0].arg[0].value.[1].[0].[0].value.[2]", fallback: "🥉")]
                List(0..<rank.count) { idx in
                    HStack{
                        if(idx < 3){
                            Text(medals[idx])
                        }else{
                            Text(__designTimeString("#5522.[1].[1].property.[0].[0].arg[0].value.[1].[0].[1].arg[1].value.[0].arg[0].value.[0].[1].[0].arg[0].value", fallback: "👏"))
                        }
                        Text(rank[idx].day.DateToStringFormatter(format: __designTimeString("#5522.[1].[1].property.[0].[0].arg[0].value.[1].[0].[1].arg[1].value.[0].arg[0].value.[1].arg[0].value.arg[0].value", fallback: "yyyy年M月d日(E)")))
                        Text(String(rank[idx].step))
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        Text(__designTimeString("#5522.[1].[1].property.[0].[0].arg[0].value.[1].[0].[1].arg[1].value.[0].arg[0].value.[3].arg[0].value", fallback: "step"))
                    }
                }
            }
        })
    #sourceLocation()
    }
}

import struct WalkCounter.RankingView
import struct WalkCounter.RankingView_Previews