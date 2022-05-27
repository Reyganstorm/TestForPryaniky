//
//  TableCellViewModel.swift
//  TestForPryaniky
//
//  Created by Руслан Штыбаев on 27.05.2022.
//

import Foundation

protocol TableCellViewModelProtocol {
    var view: String { get }
    var sampleData: [Datum]? { get }
    var imageData: Data? { get }
    init(view: String, data: [Datum]?)
    func getSampleClass(for view: String) -> Datum?
    func getMassivVariants() -> [String]
    
}

class TableCellViewModel: TableCellViewModelProtocol {
    var view: String
    
    var sampleData: [Datum]?
    
    required init(view: String, data: [Datum]?) {
        self.view = view
        self.sampleData = data
    }
    
    var imageData: Data? {
        ImageManager.shared.fetchImageData(from: getSampleClass(for: view)?.data.url)
    }
    
    func getSampleClass(for view: String) -> Datum? {
        guard let getingClasses = sampleData else { return nil }
        for searchedСlass in getingClasses {
            if searchedСlass.name == view {
                return searchedСlass
            }
        }
        return nil
    }
    
    func getMassivVariants() -> [String] {
        var strings: [String] = []
        let variants = getSampleClass(for: "selector")
        guard let massiv = variants?.data.variants else { return [] }
        for variant in massiv {
            let int = String(variant.id)
            strings.append(int)
        }
        return strings
    }
    
    
}
