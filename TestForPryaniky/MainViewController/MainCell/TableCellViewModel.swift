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
    init(view: String, data: [Datum]?)
}

class TableCellViewModel: TableCellViewModelProtocol {
    
    
    var view: String
    
    var sampleData: [Datum]?
    
    required init(view: String, data: [Datum]?) {
        self.view = view
        self.sampleData = data
    }
    
    
}
