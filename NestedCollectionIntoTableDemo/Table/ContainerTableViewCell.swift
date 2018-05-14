//
//  ContainerTableViewCell.swift
//  NestedCollectionIntoTableDemo
//
//  Created by Amir Abbas on 2/24/1397 AP.
//  Copyright © 1397 AP Amir Abbas. All rights reserved.
//

import UIKit

class ContainerTableViewCell: UITableViewCell {
    var dataSource = [UIColor]() {
        didSet {
             nestedCoontroller?.dataSourceArray = dataSource
        }
    }
    
    private var _contentOffset = CGPoint.zero
    var contentOffset: CGPoint {
        get {
            return nestedCoontroller?.contentOffset ?? _contentOffset
        }
        set {
            _contentOffset = newValue
            nestedCoontroller?.contentOffset = newValue
        }
    }
    
    weak var nestedCoontroller: NestedCollectionViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = .white
    }
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        guard self.nestedCoontroller == nil else { return }
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        let nestedCoontroller = NestedCollectionViewController(collectionViewLayout: layout)
        self.nestedCoontroller = nestedCoontroller
        let tableVC = self.next?.next as! NestableTableViewController
        tableVC.addChildViewController(nestedCoontroller)
        guard let collectionView = nestedCoontroller.collectionView else {
            fatalError()
        }
        contentView.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            ])
        
        nestedCoontroller.didMove(toParentViewController: tableVC)
        
        nestedCoontroller.dataSourceArray = dataSource
        nestedCoontroller.contentOffset = _contentOffset
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.dataSource = []
        self.contentOffset = .zero
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
