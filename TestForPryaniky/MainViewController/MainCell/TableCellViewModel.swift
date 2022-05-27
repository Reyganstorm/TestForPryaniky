//
//  TableCellViewModel.swift
//  TestForPryaniky
//
//  Created by Руслан Штыбаев on 27.05.2022.
//

import Foundation

enum SegmentedVarients: Int {
    case one = 0
    case two = 1
    case three = 2
}

protocol TableCellViewModelProtocol: AnyObject {
    var view: String { get }
    var sampleData: [Datum]? { get }
    var imageData: Data? { get }
    var selectedBind: SegmentedVarients { get set }
    init(view: String, data: [Datum]?)
    func getSampleClass(for view: String) -> Datum?
    func getCellName() -> String
    func getMassivVariants() -> [String]
    func getSegmentVarient() -> SegmentedVarients
    func getMessageFromVariantsID(at index: Int) -> String
    
}

class TableCellViewModel: TableCellViewModelProtocol {
    
    var view: String
    
    var sampleData: [Datum]?
    
    required init(view: String, data: [Datum]?) {
        self.view = view
        self.sampleData = data
        selectedBind = .one
    }
    
    var imageData: Data? {
        ImageManager.shared.fetchImageData(from: getSampleClass(for: view)?.data.url)
    }

    var selectedBind: SegmentedVarients
    
    func getSampleClass(for view: String) -> Datum? {
        guard let getingClasses = sampleData else { return nil }
        for searchedСlass in getingClasses {
            if searchedСlass.name == view {
                return searchedСlass
            }
        }
        return nil
    }
    
    func getCellName() -> String {
        let veresion = getSampleClass(for: view)
        return veresion?.data.text ?? ""
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
    
    func getSegmentVarient() -> SegmentedVarients {
        let variants = getSampleClass(for: "selector")
        selectedBind = SegmentedVarients(rawValue: (variants?.data.selectedID ?? 1) - 1) ?? .one
        return selectedBind
    }
    
    func getMessageFromVariantsID(at index: Int) -> String {
        let variants = getSampleClass(for: "selector")
        let massivVariants = variants?.data.variants
        //let index = getSegmentVarient()
        return massivVariants?[index].text ?? ""
    }
}
