//
//  MainViewController.swift
//  TestForPryaniky
//
//  Created by Руслан Штыбаев on 26.05.2022.
//

import UIKit

class MainViewController: UITableViewController {

    private var sample: Sample?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        section == 0 ? "Data" : "Views"
     }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        section == 0 ? sample?.data.count ?? 0 : sample?.view.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath)


        return cell
    }
    
}

extension MainViewController {
    private func fetchData() {
        NetworkManager.shared.fetch(from: Links.dataURL.rawValue) { data in
            self.sample = data
            self.tableView.reloadData()
        }
    }
}
