//
//  ViewController.swift
//  CollectionView
//
//  Created by DevenduTiwari on 10/05/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView : UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView.collectionViewLayout = layout
        collectionView.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension ViewController: UICollectionViewDelegate {
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        collectionView.deselectItem(at: indexPath, animated: true)
//
//    }
}

extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as! MyCollectionViewCell
        //cell.configure(with: UIImage(named: "Image")!)
        cell.fetchImage()
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let minimumInteritemSpacing:CGFloat = 10
        let cellsPerRow = 3
        let cellsPerCol = 4
        let marginsAndInsetsRow = minimumInteritemSpacing * CGFloat(cellsPerRow - 1)
        let marginsAndInsetsCol = minimumInteritemSpacing * CGFloat(cellsPerCol - 1)
        let itemWidth = ((collectionView.bounds.size.width - marginsAndInsetsRow) / CGFloat(cellsPerRow)).rounded(.down)
        let itemHeight = ((collectionView.bounds.size.height - marginsAndInsetsCol) / CGFloat(cellsPerCol)).rounded(.down)
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10 // space between each row
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
}

