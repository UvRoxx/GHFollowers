//
//  FollowerListVC.swift
//  GHFollowers
//
//  Created by UTKARSH VARMA on 2021-01-03.
//

import UIKit

class FollowerListVC: UIViewController {
   
    enum Section{
        case main
    }
    var userName:String!
    var collectionView = UICollectionView()
    var dataSource = UICollectionViewDiffableDataSource<Section,Follower>

    let networkManager = NetworkManager.shared
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        configureViewController()
        
        configureCollectionView()
        
        getFollowers()
        
       
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    func configureViewController(){
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true

    }
    
    func returnThreeColumnFlowLayout()->UICollectionViewFlowLayout{
        let width = view.bounds.width
        let padding:CGFloat = 12
        let minimumItemSpacing:CGFloat = 10
        let availableWidth = width - (padding*2) - (minimumItemSpacing*2)
//        var availableWidth:CGFloat{
//            return CGFloat((width - ((2*padding)+2*minimumItemSpacing)))// both ways work
//        }
        let itemWidth = availableWidth/3
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
        
        
        return flowLayout
    }
    
    func getFollowers(){
        networkManager.getData(userName, atPage: 1) { (result) in
            switch result{
            case .success(let followers):
                print(followers)
                break
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Bad Stuff Happend", message: error.rawValue, buttonTitle:"Ok")
                break
            }
        }
        
    }
    
    func configureCollectionView(){
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout:returnThreeColumnFlowLayout())
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemPink
        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseID)
    }
    
}
