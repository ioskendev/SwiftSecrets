//
//  SwiftSecretsTableViewController.swift
//  SwiftSecrets
//
//  Created by Yuri Volegov on 12.04.2023.
//

import UIKit

class SwiftSecretsTableViewController: UITableViewController {
    
    let secrets = DataStore.share.getPerson().secrets
    
    var currentSecret: Secret?

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return secrets.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "secret", for: indexPath)
        
        let secret = secrets[indexPath.row]
        
        var configuration = cell.defaultContentConfiguration()
        
        configuration.text = secret.title
        
        cell.contentConfiguration = configuration

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentSecret = secrets[indexPath.row]
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let currentSecret = currentSecret else { return }
        
        guard let tabBar = segue.destination as? UITabBarController else { return }
        
        if let mathirialsVC = tabBar.viewControllers?.first as? MatherialsViewController {
        //    mathirialsVC.currentSecret = currentSecret
        } else if let questionsMathirialsVC = tabBar.viewControllers?.last as? QuestionsViewController {
        //    questionsVC.currentSecret = currentSecret
        }
    }
    
}
