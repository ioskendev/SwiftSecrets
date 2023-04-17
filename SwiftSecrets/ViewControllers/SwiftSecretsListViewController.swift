//
//  SwiftSecretsTableViewController.swift
//  SwiftSecrets
//
//  Created by Yuri Volegov on 12.04.2023.
//

import UIKit

class SwiftSecretsTableViewController: UITableViewController {
    
    let secrets = DataStore.share.gerPerson().secrets // was created issue to name fix gerPerson to getPerson
    
    var currentSecret: Secret?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

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
        guard let tabBar = segue.destination as? UITabBarController else { return }
        guard let firstVC = tabBar.viewControllers?.first else { return }
        guard let mathirialsVC = firstVC as? MatherialsViewController else { return }
        
       // mathirialsVC.currentSecret = currentSecret
    }
    

}
