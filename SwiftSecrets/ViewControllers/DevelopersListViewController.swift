//
//  AboutListViewController.swift
//  SwiftSecrets
//
//  Created by Yuri Volegov on 23.04.2023.
//

import UIKit

final class DevelopersListViewController: UITableViewController {
    
    private let authors = ["Yuri Volegov", "Elena Loginova"]

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        authors.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "developer", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        
        content.text = authors[indexPath.row]
        content.image = UIImage(named: authors[indexPath.row])
        
        cell.contentConfiguration = content

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        
        guard let developersVC = segue.destination as? DevelopersViewController else { return }
        
        developersVC.developerName = authors[indexPath.row]
    }

}
