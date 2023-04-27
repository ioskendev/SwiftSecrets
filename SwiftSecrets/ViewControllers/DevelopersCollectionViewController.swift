//
//  DevelopersCollectionViewController.swift
//  SwiftSecrets
//
//  Created by Yuri Volegov on 26.04.2023.
//

import UIKit

private let reuseIdentifier = "developerContent"

final class DevelopersCollectionViewController: UICollectionViewController {
    
    private let developers = ["Yuri Volegov", "Elena Loginova"]
    
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return developers.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: reuseIdentifier,
            for: indexPath
        ) as! DeveloperCell
        
        cell.developerImageView.image = UIImage(named: developers[indexPath.row])
        cell.developerLabel.text = developers[indexPath.row]
        cell.developerImageView.layer.cornerRadius = 10
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.estimatedItemSize = .zero
        
        return cell
    }
    
}

// MARK: Extensions
extension DevelopersCollectionViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let itemSize = (screenWidth / 2) - 10
        
        return CGSize(width: itemSize, height: itemSize)
    }
    
}
