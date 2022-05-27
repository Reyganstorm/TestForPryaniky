//
//  TableViewCell.swift
//  TestForPryaniky
//
//  Created by Руслан Штыбаев on 27.05.2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    var viewModel: TableCellViewModelProtocol! {
        didSet {
            if viewModel.view == "selector" {
                textLabel?.text = "Выберите вариант"
                
                let customSC = UISegmentedControl(items: ["1", "2"])
                customSC.selectedSegmentIndex = 0
                customSC.layer.cornerRadius = 5.0
                customSC.backgroundColor = .lightGray
                customSC.tintColor = .white
                customSC.addTarget(self, action: #selector(changeDistance), for: .valueChanged)
                
                accessoryView = customSC
                
            } else if viewModel.view == "picture" {
                let veresion = getSampleClass(for: viewModel.view)
                
                textLabel?.text = "\(veresion?.data.text ?? "")"
                
                NetworkManager.shared.fetchImage(from: veresion?.data.url) { data in
                    self.imageView?.image = UIImage(data: data)
                }
            } else {
                let veresion = getSampleClass(for: viewModel.view)
                textLabel?.text = "\(veresion?.data.text ?? "")"
            }
        }
    }
}

extension TableViewCell {
    
    private func getSampleClass(for view: String) -> Datum? {
        guard let getingClasses = viewModel.sampleData else { return nil }
        for searchedСlass in getingClasses {
            if searchedСlass.name == view {
                return searchedСlass
            }
        }
        return nil
    }
    
    private func getMassivVariants() -> [String] {
        var strings: [String] = []
        let variants = getSampleClass(for: "selector")
        guard let massiv = variants?.data.variants else { return [] }
        for variant in massiv {
            let int = String(variant.id)
            strings.append(int)
        }
        return strings
    } 
    @objc func changeDistance() {
        
      }
}
