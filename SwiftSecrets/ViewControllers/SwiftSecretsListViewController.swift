//
//  SwiftSecretsTableViewController.swift
//  SwiftSecrets
//
//  Created by Yuri Volegov on 12.04.2023.
//

import UIKit

final class SwiftSecretsTableViewController: UITableViewController {
    
    private var secrets = DataStore.share.getSecrets()
    private var index: Int!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        secrets.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "secret", for: indexPath)
        let secret = secrets[indexPath.row]
        
        cell.configure(with: secret)

        return cell
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        guard let tabBar = segue.destination as? TabBarController else { return }
        index = indexPath.row
        
        tabBar.secret = secrets[indexPath.row]
        
        if let questionsVC = tabBar.viewControllers?.last as? QuestionsViewController {
            questionsVC.delegate = self
        }
    }
    
    
    @IBAction func sortingSecrets(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            secrets = secrets.sorted { $0.title < $1.title }
        } else {
            secrets = secrets.sorted { $0.result < $1.result
            }
        }
        tableView.reloadData()
    }
    
}

extension SwiftSecretsTableViewController: QuestionsViewControllerDelegate {
    
    func resultUpdate(result: Int) {
        secrets[index].result = result
    }
    
}

