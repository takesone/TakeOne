//
//  FeedViewController.swift
//  TakeOne
//
//  Created by YasuhiroWada on 2016/05/30.
//  Copyright © 2016年 YuichiSawada. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    @IBOutlet weak var feedTableView: FeedTableView!
    
    // MARK: - View Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Private Methods -
    
    private func setupNavigationBar() {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
}
