//
//  MainMapViewController.swift
//  MyFavoriteStoreList
//
//  Created by changgyo seo on 2022/12/26.
//

import UIKit

class MainMapViewController: UIViewController {
   
    var viewModel: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
    }
    
    init(dependency: String) {
        self.viewModel = dependency
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
}
