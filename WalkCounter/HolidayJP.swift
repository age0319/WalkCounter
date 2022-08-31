//
//  HolidayJP.swift
//  WalkCounter
//
//  Created by nokkun on 2021/11/22.
//

import Foundation

class HolidayJP : ObservableObject{

    var data:[String:String] = [:]
    
    init() {
        loadData(completion: { result in
            self.data = result.dict
        })
    }
    
    struct Holiday: Decodable {
        
        let dict : [String:String]
        
        init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            let dict = try container.decode([String:String].self)
            self.dict = dict
        }
    }
        
    func loadData(completion:@escaping (Holiday) -> ()) {
            
        let url_string = "https://holidays-jp.github.io/api/v1/date.json"
        
        let url = URL(string: url_string)!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) {(data, response, error) in  //非同期で通信を行う
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            guard let decodedResponse = try? decoder.decode(Holiday.self, from: data) else {
                print("Json decode エラー")
                return
            }
            
            completion(decodedResponse)
            
        }
        
        task.resume()
        
    }

}
