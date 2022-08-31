//
//  SettingView.swift
//  WalkCounter
//
//  Created by nokkun on 2021/11/18.
//

import SwiftUI

struct SettingView: View {
    //SettingViewの引数として指定する
    @StateObject var hkmanager:HKManager
    
    //SettingView内で設定する
    @State private var selection:Int = 0
    @State var stepSelect = Array(stride(from: 1000, through: 20000, by: 1000))

    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("1日の目標歩数", selection: $selection) {
                        ForEach(0 ..< stepSelect.count, id:\.self) { num in
                            Text(String(stepSelect[num]))
                        }
                    }
                    .onChange(of: selection, perform: { value in
                        hkmanager.target = stepSelect[value]
                    })
                }
                
            }
            .navigationTitle("設定")
            
        }
        .onAppear(perform: {
            self.selection =  (hkmanager.target / 1000) - 1
        })
    }
    
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        let h = HKManager()
        SettingView(hkmanager: h)
            .preferredColorScheme(.dark)
    }
}
