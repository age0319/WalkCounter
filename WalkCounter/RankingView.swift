//
//  RankingView.swift
//  WalkCounter
//
//  Created by nokkun on 2021/11/18.
//

import SwiftUI

struct RankingView: View {
    @StateObject var hkmanager:HKManager
    var body: some View {
        
        VStack{
            Text("ランキング")
                .font(.largeTitle)

            if let rank = hkmanager.getRanking(){
                let medals = ["🥇","🥈","🥉"]
                List(0..<rank.count) { idx in
                    HStack{
                        if(idx < 3){
                            Text(medals[idx])
                        }else{
                            Text("👏")
                        }
                        Text(rank[idx].day.DateToStringFormatter(format: "yyyy年M月d日(E)"))
                        Text(String(rank[idx].step))
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        Text("step")
                    }
                }
            }
        }
    }
}

struct RankingView_Previews: PreviewProvider {
    static var previews: some View {
        RankingView(hkmanager: HKManager())
            .preferredColorScheme(.dark)
    }
}
