@_private(sourceFile: "SettingView.swift") import WalkCounter
import SwiftUI
import SwiftUI

extension SettingView_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/nokkun/Documents/WalkCounter/WalkCounter/SettingView.swift", line: 45)
        let h = HKManager()
        __designTimeSelection(SettingView(hkmanager: __designTimeSelection(h, "#4161.[2].[0].property.[0].[1].arg[0].value"))
            .preferredColorScheme(.dark), "#4161.[2].[0].property.[0].[1]")
    #sourceLocation()
    }
}

extension SettingView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/nokkun/Documents/WalkCounter/WalkCounter/SettingView.swift", line: 19)
        AnyView(__designTimeSelection(NavigationView {
            __designTimeSelection(Form {
                __designTimeSelection(Section {
                    __designTimeSelection(Picker(__designTimeString("#4161.[1].[3].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[0].arg[0].value", fallback: "1日の目標歩数"), selection: __designTimeSelection($selection, "#4161.[1].[3].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[0].arg[1].value")) {
                        __designTimeSelection(ForEach(0 ..< stepSelect.count, id:\.self) { num in
                            __designTimeSelection(Text(__designTimeSelection(String(__designTimeSelection(stepSelect[__designTimeSelection(num, "#4161.[1].[3].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[0].arg[2].value.[0].arg[2].value.[0].arg[0].value.arg[0].value.[0].value")], "#4161.[1].[3].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[0].arg[2].value.[0].arg[2].value.[0].arg[0].value.arg[0].value")), "#4161.[1].[3].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[0].arg[2].value.[0].arg[2].value.[0].arg[0].value")), "#4161.[1].[3].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[0].arg[2].value.[0].arg[2].value.[0]")
                        }, "#4161.[1].[3].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[0].arg[2].value.[0]")
                    }
                    .onChange(of: __designTimeSelection(selection, "#4161.[1].[3].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[0].modifier[0].arg[0].value"), perform: { value in
                        hkmanager.target = stepSelect[value]
                    }), "#4161.[1].[3].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[0]")
                }, "#4161.[1].[3].property.[0].[0].arg[0].value.[0].arg[0].value.[0]")
                
            }
            .navigationTitle(__designTimeString("#4161.[1].[3].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value", fallback: "設定")), "#4161.[1].[3].property.[0].[0].arg[0].value.[0]")
            
        }
        .onAppear(perform: {
            self.selection =  (hkmanager.target / 1000) - 1
        }), "#4161.[1].[3].property.[0].[0]"))
    #sourceLocation()
    }
}

import struct WalkCounter.SettingView
import struct WalkCounter.SettingView_Previews