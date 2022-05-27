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
                textLabel?.text = viewModel.getMessageFromVariantsID(at: viewModel.selectedBind.rawValue)
                
                let customSC = UISegmentedControl(items: viewModel.getMassivVariants())
                customSC.selectedSegmentIndex = viewModel.getSegmentVarient().rawValue 
                customSC.layer.cornerRadius = 5.0
                customSC.backgroundColor = .lightGray
                customSC.tintColor = .white
                customSC.addTarget(self, action: #selector(changeVariant), for: .valueChanged)
                
                accessoryView = customSC
                
            } else if viewModel.view == "picture" {
                textLabel?.text = viewModel.getCellName()
                guard let imageData = viewModel.imageData else { return }
                imageView?.image = UIImage(data: imageData)
            } else {
                textLabel?.text = viewModel.getCellName()
            }
        }
    }
    @objc func changeVariant(_ sender: UISegmentedControl) {
    }
}

