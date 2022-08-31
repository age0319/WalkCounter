//
//  CellView.swift
//  WalkCounter
//
//  Created by nokkun on 2021/11/26.
//

import SwiftUI

struct CellView: View {
    let maxheight:CGFloat = 60.0

    let target:Int
    let isThisMonth:Bool
    let step:Int?
    let isRunnning:Bool?
    
    var body: some View {
        
        ZStack{
            
            if let step = step{
                
                let (ratio,ratio2nd) = getBarHeight(step: step)
                
                let color = isThisMonth ? Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)) : Color.gray
                //バーグラフ
                Rectangle()
                    .fill(color)
                    .scaleEffect(CGSize(width: 1, height: ratio), anchor: .bottom)
                    .opacity(0.5)
                    .frame(height:maxheight)
                
                if let r = ratio2nd{
                    Rectangle()
                        .fill(color)
                        .scaleEffect(CGSize(width: 1, height: r), anchor: .bottom)
                        .opacity(1)
                        .frame(height:maxheight)
                }
                
                //歩数
                Text(String(step))
                    .font(.footnote)
                
            }else{
                Rectangle()
                    .fill(Color("CellBackGround"))
                    .frame(height:maxheight)
            }
                
            if let _ = isRunnning {
                let op = isThisMonth ? 1 : 0.5
                VStack {
                    Text("🏃‍♂️")
                        .font(.footnote)
                        .opacity(op)
                    Spacer()
                }
                .frame(height:maxheight)
            }
            
        }
        
    }
    func getBarHeight(step:Int) -> (CGFloat,CGFloat?) {
        var ratio = CGFloat(step) / CGFloat(target)
        var ratio2nd:CGFloat?
        if(ratio > 1.0){
            ratio2nd = ratio - 1.0
            ratio = 1.0
            if(ratio2nd! > 1.0){
                ratio2nd = 1.0
            }
        }
        
        return (ratio,ratio2nd)
    }
    
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(target:7000,isThisMonth: true,step: 8000, isRunnning: true)
            .preferredColorScheme(.dark)
    }
}
