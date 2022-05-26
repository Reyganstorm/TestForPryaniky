//
//  NetworkManager.swift
//  TestForPryaniky
//
//  Created by Руслан Штыбаев on 26.05.2022.
//

import Foundation

enum Links: String {
    case dataURL =  "https://pryaniky.com/static/json/sample.json"
}

class NetworkManager {
    let shared = NetworkManager()
    
    private init() {}
    
    func fetch(from url: String, and complition: @escaping(Sample) -> Void) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error.debugDescription)
                return
            }
            
            do {
                let sample = try JSONDecoder().decode(Sample.self, from: data)
                
                DispatchQueue.main.async {
                    complition(sample)
                }
            } catch let error {
                print(error)
            }
            

        }.resume()
    }
}
