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
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetch(from url: String, and complition: @escaping(Sample) -> Void) {
        guard let url = URL(string: url) else { return print(4)}
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(3)
                print(error.debugDescription)
                return
            }
            
            do {
                let sample = try JSONDecoder().decode(Sample.self, from: data)
                
                DispatchQueue.main.async {
                    print(1)
                    complition(sample)
                }
            } catch let error {
                print(2)
                print(error)
            }
        }.resume()
    }
}
