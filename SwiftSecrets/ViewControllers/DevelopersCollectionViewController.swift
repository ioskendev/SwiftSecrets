//
//  DevelopersCollectionViewController.swift
//  SwiftSecrets
//
//  Created by Yuri Volegov on 26.04.2023.
//

import UIKit

enum IDSpace{
    
    static let cellReuseIdentifier = "developerContent"
    static let sectionHeaderReuseIdentifier = "DevelopersHeaderCollectionReusableView"
    
}

final class DevelopersCollectionViewController: UICollectionViewController {
    
    private let developers = ["Yuri Volegov", "Elena Loginova"]
    
    private lazy var screenWidth = UIScreen.main.bounds.width
    private lazy var itemSize = (screenWidth / 2) - 24
    
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        developers.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: IDSpace.cellReuseIdentifier,
            for: indexPath
        ) as! DevelopersCell
        
        let developer = developers[indexPath.row]
        
        cell.configure(with: developer)
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.estimatedItemSize = .zero
        
        return cell
    }
    
}

// MARK: Extensions
extension DevelopersCollectionViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: itemSize, height: itemSize)
    }
    
}

extension DevelopersCollectionViewController {
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if let sectionHeader = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: IDSpace.sectionHeaderReuseIdentifier,
            for: indexPath
        ) as? DevelopersHeaderCollectionReusableView{
            sectionHeader.developersCollectionHeaderLabel.text = "ioskendev team"
            return sectionHeader
        }
        return UICollectionReusableView()
    }
    
}
