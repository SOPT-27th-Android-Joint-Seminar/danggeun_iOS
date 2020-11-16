//
//  DetailViewController.swift
//  Dangma
//
//  Created by 오준현 on 2020/11/14.
//

import UIKit
import MessageUI

class DetailViewController: UIViewController {
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0,
                                                                left: 0,
                                                                bottom: 0,
                                                                right: 0)
        
        scrollView.backgroundColor = UIColor.yellow.withAlphaComponent(0.5)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.backgroundColor = .red
        collectionView.backgroundView?.backgroundColor = .yellow
        
        return collectionView
    }()
    
    let backButton: UIButton = {
        let button = UIButton()
        
        button.backgroundColor = UIColor.red.withAlphaComponent(0.1)
        
        return button
    }()
    
    let shareButton: UIButton = {
        let button = UIButton()
        
        button.backgroundColor = UIColor.red.withAlphaComponent(0.1)
        
        return button
    }()
    
    let optionButton: UIButton = {
        let button = UIButton()
        
        button.backgroundColor = UIColor.red.withAlphaComponent(0.1)
        
        return button
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "123123"
        label.font = .systemFont(ofSize: 100)
        label.backgroundColor = UIColor.blue.withAlphaComponent(0.1)
        return label
    }()
    
    let localLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    let temperatureLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    let smileImageView: UIImageView = {
       let imageView = UIImageView()
        
        return imageView
    }()
    
    let temperatureGuideLabel: UILabel = {
       let label = UILabel()
        
        return label
    }()
    
    let splitView: UIView = {
       let v = UIView()
        
        return v
    }()
    
    let productLabel: UILabel = {
       let label = UILabel()
        
        return label
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel()
         
         return label
    }()
    
    let timeLabel: UILabel = {
       let label = UILabel()
        
        return label
    }()
    
    let contentLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
        scrollView.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(BannerCVCell.self,
                                forCellWithReuseIdentifier: BannerCVCell.reuseIdentifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigation()
    }
    
    func navigation() {
        navigationController?.isNavigationBarHidden = true
    }
}

extension DetailViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

    }
}

extension DetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
}

extension DetailViewController: UICollectionViewDelegate { }

extension DetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: BannerCVCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        cell.backgroundColor = .blue
        return cell
    }
    
}
