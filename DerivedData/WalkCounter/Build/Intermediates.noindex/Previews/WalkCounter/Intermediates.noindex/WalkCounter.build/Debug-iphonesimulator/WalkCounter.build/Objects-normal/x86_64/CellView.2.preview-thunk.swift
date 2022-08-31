@_private(sourceFile: "CellView.swift") import WalkCounter
import SwiftUI
import SwiftUI

extension CellView_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/nokkun/Documents/WalkCounter/WalkCounter/CellView.swift", line: 84)
        AnyView(CellView(target:__designTimeInteger("#3952.[2].[0].property.[0].[0].arg[0].value", fallback: 7000),isThisMonth: __designTimeBoolean("#3952.[2].[0].property.[0].[0].arg[1].value", fallback: true),step: __designTimeInteger("#3952.[2].[0].property.[0].[0].arg[2].value", fallback: 8000), isRunnning: __designTimeBoolean("#3952.[2].[0].property.[0].[0].arg[3].value", fallback: true))
            .preferredColorScheme(.dark))
    #sourceLocation()
    }
}

extension CellView {
    @_dynamicReplacement(for: getBarHeight(step:)) private func __preview__getBarHeight(step:Int) -> (CGFloat,CGFloat?) {
        #sourceLocation(file: "/Users/nokkun/Documents/WalkCounter/WalkCounter/CellView.swift", line: 67)
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
    #sourceLocation()
    }
}

extension CellView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/nokkun/Documents/WalkCounter/WalkCounter/CellView.swift", line: 20)
        
        AnyView(ZStack{
            
            if let step = step{
                
                let (ratio,ratio2nd) = getBarHeight(step: step)
                
                let color = isThisMonth ? Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)) : Color.gray
                //バーグラフ
                Rectangle()
                    .fill(color)
                    .scaleEffect(CGSize(width: __designTimeInteger("#3952.[1].[5].property.[0].[0].arg[0].value.[0].[0].[2].modifier[1].arg[0].value.arg[0].value", fallback: 1), height: ratio), anchor: .bottom)
                    .opacity(__designTimeFloat("#3952.[1].[5].property.[0].[0].arg[0].value.[0].[0].[2].modifier[2].arg[0].value", fallback: 0.5))
                    .frame(height:maxheight)
                
                if let r = ratio2nd{
                    Rectangle()
                        .fill(color)
                        .scaleEffect(CGSize(width: __designTimeInteger("#3952.[1].[5].property.[0].[0].arg[0].value.[0].[0].[3].[0].[0].modifier[1].arg[0].value.arg[0].value", fallback: 1), height: r), anchor: .bottom)
                        .opacity(__designTimeInteger("#3952.[1].[5].property.[0].[0].arg[0].value.[0].[0].[3].[0].[0].modifier[2].arg[0].value", fallback: 1))
                        .frame(height:maxheight)
                }
                
                //歩数
                Text(String(step))
                    .font(.footnote)
                
            }else{
                Rectangle()
                    .fill(Color(__designTimeString("#3952.[1].[5].property.[0].[0].arg[0].value.[0].[1].[0].modifier[0].arg[0].value.arg[0].value", fallback: "CellBackGround")))
                    .frame(height:maxheight)
            }
                
            if let _ = isRunnning {
                let op = isThisMonth ? __designTimeInteger("#3952.[1].[5].property.[0].[0].arg[0].value.[1].[0].[0].value.then", fallback: 1) : __designTimeFloat("#3952.[1].[5].property.[0].[0].arg[0].value.[1].[0].[0].value.else", fallback: 0.5)
                VStack {
                    Text(__designTimeString("#3952.[1].[5].property.[0].[0].arg[0].value.[1].[0].[1].arg[0].value.[0].arg[0].value", fallback: "🏃‍♂️"))
                        .font(.footnote)
                        .opacity(op)
                    Spacer()
                }
                .frame(height:maxheight)
            }
            
        })
        
    #sourceLocation()
    }
}

import struct WalkCounter.CellView
import struct WalkCounter.CellView_Previews