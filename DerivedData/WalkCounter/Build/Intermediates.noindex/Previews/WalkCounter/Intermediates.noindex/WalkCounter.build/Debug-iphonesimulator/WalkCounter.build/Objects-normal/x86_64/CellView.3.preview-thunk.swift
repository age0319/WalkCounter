@_private(sourceFile: "CellView.swift") import WalkCounter
import SwiftUI
import SwiftUI

extension CellView_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/nokkun/Documents/WalkCounter/WalkCounter/CellView.swift", line: 84)
        AnyView(__designTimeSelection(CellView(target:__designTimeInteger("#3952.[2].[0].property.[0].[0].arg[0].value", fallback: 7000),isThisMonth: __designTimeBoolean("#3952.[2].[0].property.[0].[0].arg[1].value", fallback: true),step: __designTimeInteger("#3952.[2].[0].property.[0].[0].arg[2].value", fallback: 8000), isRunnning: __designTimeBoolean("#3952.[2].[0].property.[0].[0].arg[3].value", fallback: true))
            .preferredColorScheme(.dark), "#3952.[2].[0].property.[0].[0]"))
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
        
        AnyView(__designTimeSelection(ZStack{
            
            if let step = step{
                
                let (ratio,ratio2nd) = getBarHeight(step: step)
                
                let color = __designTimeSelection(isThisMonth, "#3952.[1].[5].property.[0].[0].arg[0].value.[0].[0].[1].value.if") ? __designTimeSelection(Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)), "#3952.[1].[5].property.[0].[0].arg[0].value.[0].[0].[1].value.then") : __designTimeSelection(Color.gray, "#3952.[1].[5].property.[0].[0].arg[0].value.[0].[0].[1].value.else")
                //バーグラフ
                __designTimeSelection(Rectangle()
                    .fill(__designTimeSelection(color, "#3952.[1].[5].property.[0].[0].arg[0].value.[0].[0].[2].modifier[0].arg[0].value"))
                    .scaleEffect(__designTimeSelection(CGSize(width: __designTimeInteger("#3952.[1].[5].property.[0].[0].arg[0].value.[0].[0].[2].modifier[1].arg[0].value.arg[0].value", fallback: 1), height: __designTimeSelection(ratio, "#3952.[1].[5].property.[0].[0].arg[0].value.[0].[0].[2].modifier[1].arg[0].value.arg[1].value")), "#3952.[1].[5].property.[0].[0].arg[0].value.[0].[0].[2].modifier[1].arg[0].value"), anchor: .bottom)
                    .opacity(__designTimeFloat("#3952.[1].[5].property.[0].[0].arg[0].value.[0].[0].[2].modifier[2].arg[0].value", fallback: 0.5))
                    .frame(height:__designTimeSelection(maxheight, "#3952.[1].[5].property.[0].[0].arg[0].value.[0].[0].[2].modifier[3].arg[0].value")), "#3952.[1].[5].property.[0].[0].arg[0].value.[0].[0].[2]")
                
                if let r = ratio2nd{
                    __designTimeSelection(Rectangle()
                        .fill(__designTimeSelection(color, "#3952.[1].[5].property.[0].[0].arg[0].value.[0].[0].[3].[0].[0].modifier[0].arg[0].value"))
                        .scaleEffect(__designTimeSelection(CGSize(width: __designTimeInteger("#3952.[1].[5].property.[0].[0].arg[0].value.[0].[0].[3].[0].[0].modifier[1].arg[0].value.arg[0].value", fallback: 1), height: __designTimeSelection(r, "#3952.[1].[5].property.[0].[0].arg[0].value.[0].[0].[3].[0].[0].modifier[1].arg[0].value.arg[1].value")), "#3952.[1].[5].property.[0].[0].arg[0].value.[0].[0].[3].[0].[0].modifier[1].arg[0].value"), anchor: .bottom)
                        .opacity(__designTimeInteger("#3952.[1].[5].property.[0].[0].arg[0].value.[0].[0].[3].[0].[0].modifier[2].arg[0].value", fallback: 1))
                        .frame(height:__designTimeSelection(maxheight, "#3952.[1].[5].property.[0].[0].arg[0].value.[0].[0].[3].[0].[0].modifier[3].arg[0].value")), "#3952.[1].[5].property.[0].[0].arg[0].value.[0].[0].[3].[0].[0]")
                }
                
                //歩数
                __designTimeSelection(Text(__designTimeSelection(String(__designTimeSelection(step, "#3952.[1].[5].property.[0].[0].arg[0].value.[0].[0].[4].arg[0].value.arg[0].value")), "#3952.[1].[5].property.[0].[0].arg[0].value.[0].[0].[4].arg[0].value"))
                    .font(.footnote), "#3952.[1].[5].property.[0].[0].arg[0].value.[0].[0].[4]")
                
            }else{
                __designTimeSelection(Rectangle()
                    .fill(__designTimeSelection(Color(__designTimeString("#3952.[1].[5].property.[0].[0].arg[0].value.[0].[1].[0].modifier[0].arg[0].value.arg[0].value", fallback: "CellBackGround")), "#3952.[1].[5].property.[0].[0].arg[0].value.[0].[1].[0].modifier[0].arg[0].value"))
                    .frame(height:__designTimeSelection(maxheight, "#3952.[1].[5].property.[0].[0].arg[0].value.[0].[1].[0].modifier[1].arg[0].value")), "#3952.[1].[5].property.[0].[0].arg[0].value.[0].[1].[0]")
            }
                
            if let _ = isRunnning {
                let op = __designTimeSelection(isThisMonth, "#3952.[1].[5].property.[0].[0].arg[0].value.[1].[0].[0].value.if") ? __designTimeInteger("#3952.[1].[5].property.[0].[0].arg[0].value.[1].[0].[0].value.then", fallback: 1) : __designTimeFloat("#3952.[1].[5].property.[0].[0].arg[0].value.[1].[0].[0].value.else", fallback: 0.5)
                __designTimeSelection(VStack {
                    __designTimeSelection(Text(__designTimeString("#3952.[1].[5].property.[0].[0].arg[0].value.[1].[0].[1].arg[0].value.[0].arg[0].value", fallback: "🏃‍♂️"))
                        .font(.footnote)
                        .opacity(__designTimeSelection(op, "#3952.[1].[5].property.[0].[0].arg[0].value.[1].[0].[1].arg[0].value.[0].modifier[1].arg[0].value")), "#3952.[1].[5].property.[0].[0].arg[0].value.[1].[0].[1].arg[0].value.[0]")
                    __designTimeSelection(Spacer(), "#3952.[1].[5].property.[0].[0].arg[0].value.[1].[0].[1].arg[0].value.[1]")
                }
                .frame(height:__designTimeSelection(maxheight, "#3952.[1].[5].property.[0].[0].arg[0].value.[1].[0].[1].modifier[0].arg[0].value")), "#3952.[1].[5].property.[0].[0].arg[0].value.[1].[0].[1]")
            }
            
        }, "#3952.[1].[5].property.[0].[0]"))
        
    #sourceLocation()
    }
}

import struct WalkCounter.CellView
import struct WalkCounter.CellView_Previews