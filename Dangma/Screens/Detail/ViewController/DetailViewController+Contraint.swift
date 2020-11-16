//
//  File.swift
//  Dangma
//
//  Created by 오준현 on 2020/11/14.
//

extension DetailViewController {
    
    func layout() {
        view.addSubview(scrollView)
        scrollView.addSubview(collectionView)
        scrollView.addSubview(nameLabel)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
//        collectionView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
//        collectionView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
//        collectionView.heightAnchor.constraint(equalToConstant: 400).isActive = true
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 100).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -1000).isActive = true
//        nameLabel.heightAnchor.constraint(equalToConstant: 1000).isActive = true
        
    }

}
