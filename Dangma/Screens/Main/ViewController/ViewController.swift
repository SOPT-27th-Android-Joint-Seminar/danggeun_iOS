//
//  ViewController.swift
//  Dangma
//
//  Created by 오준현 on 2020/11/14.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        // cell 왼쪽 - 셀 사이 - cell 오른쪽 간격이 모두 같게 조절 (cell 하나가 162로 고정되어있음)
        layout.sectionInset = UIEdgeInsets(top: 0, left: (view.frame.width - 324)/3, bottom: 0, right: (view.frame.width - 324)/3)
        layout.itemSize = CGSize(width: 162, height: 260)
        
        collectionView.register(HomeCollectionViewCell.nib(), forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
        collectionView.collectionViewLayout = layout
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
    }


    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as? HomeCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.itemImage.image = itemData[indexPath.row].image
        cell.nameLabel.text = itemData[indexPath.row].name
        cell.whereLabel.text = (itemData[indexPath.row].location!) + " · " + (itemData[indexPath.row].time!)
        cell.moneyLabel.text = itemData[indexPath.row].howMuch
        cell.heartLabel.text = "\(String(describing: itemData[indexPath.row].heart ?? 0))"
        cell.commentsLabel.text = "\(String(describing: itemData[indexPath.row].comments ?? 0))"
        
        return cell
    }
    
}
