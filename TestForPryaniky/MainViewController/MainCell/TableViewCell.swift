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
                
                let customSC = UISegmentedControl(items: viewModel.getMassivVariants())
                customSC.selectedSegmentIndex = 0
                customSC.layer.cornerRadius = 5.0
                customSC.backgroundColor = .lightGray
                customSC.tintColor = .white
                customSC.addTarget(self, action: #selector(changeVariant), for: .valueChanged)
                
                accessoryView = customSC
                
            } else if viewModel.view == "picture" {
                let veresion = viewModel.getSampleClass(for: viewModel.view)
                
                textLabel?.text = "\(veresion?.data.text ?? "")"
                guard let imageData = viewModel.imageData else { return }
                imageView?.image = UIImage(data: imageData)
            } else {
                let veresion = viewModel.getSampleClass(for: viewModel.view)
                textLabel?.text = "\(veresion?.data.text ?? "")"
            }
        }
    }
}

extension TableViewCell {
    @objc func changeVariant() {
      }
}
