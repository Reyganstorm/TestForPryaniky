//
//  MainViewModel.swift
//  TestForPryaniky
//
//  Created by Руслан Штыбаев on 27.05.2022.
//

import Foundation
import UIKit

protocol MainViewModelProtocol: AnyObject {
    var sample: Sample? { get }
    func fetchData(completion: @escaping() -> Void)
    func numberOfRows() -> Int
    func cellViewModel(at indexPath: IndexPath) -> TableCellViewModelProtocol
    func getMessage(at indexPath: IndexPath) -> String
}

class MainViewModel: MainViewModelProtocol {
    var sample: Sample? = nil
    
    func fetchData(completion: @escaping () -> Void) {
        NetworkManager.shared.fetch(from: Links.dataURL.rawValue) { data in
            self.sample = data
            completion()
        }
    }
    
    func numberOfRows() -> Int {
        sample?.view.count ?? 0
    }
    
    func cellViewModel(at indexPath: IndexPath) -> TableCellViewModelProtocol {
        let view = sample?.view[indexPath.row] ?? ""
        return TableCellViewModel(view: view, data: sample?.data)
    }
    
    func getMessage(at indexPath: IndexPath) -> String {
        let view = sample?.view[indexPath.row] ?? ""
        let datum = getSampleClass(for: view)
        return datum?.name ?? ""
    }
    
    private func getSampleClass(for view: String) -> Datum? {
        guard let getingClasses = sample?.data else { return nil }
        for searchedСlass in getingClasses {
            if searchedСlass.name == view {
                return searchedСlass
            }
        }
        return nil
    }
}

