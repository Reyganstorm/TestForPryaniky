//
//  ImageManager.swift
//  TestForPryaniky
//
//  Created by Руслан Штыбаев on 27.05.2022.
//

import Foundation

class ImageManager {
    static let shared = ImageManager()
    
    private init() {}
    
    func fetchImageData(from url: String?) -> Data? {
        guard let url = URL(string: url ?? "") else {
            return nil
        }
        guard let imageData = try? Data(contentsOf: url) else { return nil }
        return imageData
    }
}
