@_private(sourceFile: "SettingView.swift") import WalkCounter
import SwiftUI
import SwiftUI

extension SettingView_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/nokkun/Documents/WalkCounter/WalkCounter/SettingView.swift", line: 45)
        let h = HKManager()
        SettingView(hkmanager: h)
            .preferredColorScheme(.dark)
    #sourceLocation()
    }
}

extension SettingView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/nokkun/Documents/WalkCounter/WalkCounter/SettingView.swift", line: 19)
        AnyView(NavigationView {
            Form {
                Section {
                    Picker(__designTimeString("#4161.[1].[3].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[0].arg[0].value", fallback: "1日の目標歩数"), selection: $selection) {
                        ForEach(0 ..< stepSelect.count, id:\.self) { num in
                            Text(String(stepSelect[num]))
                        }
                    }
                    .onChange(of: selection, perform: { value in
                        hkmanager.target = stepSelect[value]
                    })
                }
                
            }
            .navigationTitle(__designTimeString("#4161.[1].[3].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value", fallback: "設定"))
            
        }
        .onAppear(perform: {
            self.selection =  (hkmanager.target / 1000) - 1
        }))
    #sourceLocation()
    }
}

import struct WalkCounter.SettingView
import struct WalkCounter.SettingView_Previews