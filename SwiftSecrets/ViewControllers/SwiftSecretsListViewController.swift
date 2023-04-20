//
//  SwiftSecretsTableViewController.swift
//  SwiftSecrets
//
//  Created by Yuri Volegov on 12.04.2023.
//

import UIKit

final class SwiftSecretsTableViewController: UITableViewController {
    
    private let secrets = DataStore.share.getSecrets()

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        secrets.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "secret", for: indexPath)
        let secret = secrets[indexPath.row]
        
        var configuration = cell.defaultContentConfiguration()
        configuration.text = secret.title
        cell.contentConfiguration = configuration

        return cell
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        guard let tabBar = segue.destination as? UITabBarController else { return }
        
        if let mathirialsVC = tabBar.viewControllers?.first as? MatherialsViewController {
            mathirialsVC.secret = secrets[indexPath.row]
        } else if let questionsVC = tabBar.viewControllers?.last as? QuestionsViewController {
            questionsVC.secret = secrets[indexPath.row]
        }
    }
    
}
