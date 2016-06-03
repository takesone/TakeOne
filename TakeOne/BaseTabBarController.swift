//
//  BaseTabBarController.swift
//  TakeOne
//
//  Created by YasuhiroWada on 2016/05/27.
//  Copyright © 2016年 YuichiSawada. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
    // MARK: - View Cycle Methods -

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViewControllers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Private Methods -
    
    private func setUpViewControllers() {
        // 呼びたいストーリーボードを定義
        let feedSB = UIStoryboard(name: "Feed", bundle: nil)
        let searchSB = UIStoryboard(name: "Search", bundle: nil)
        let registrationSB = UIStoryboard(name: "Registration", bundle: nil)
        let messageSB = UIStoryboard(name: "Message", bundle: nil)
        let mypageSB = UIStoryboard(name: "Mypage", bundle: nil)
        
        // はじめに呼び出されるべきところを定義する
        let feedVC = feedSB.instantiateInitialViewController()!
        let searchVC = searchSB.instantiateInitialViewController()!
        let registrationVC = registrationSB.instantiateInitialViewController()!
        let messageVC = messageSB.instantiateInitialViewController()!
        let mypageVC = mypageSB.instantiateInitialViewController()!
        // 読み込むビューを定義する(配下)
        viewControllers = [
            feedVC,
            searchVC,
            registrationVC,
            messageVC,
            mypageVC,
        ]
        
        setupTabBar()
        
        //一番はじめに開かれるビューコントローラーの設定
        selectedIndex = 0
    }
    
    private func setupTabBar() {
        let topItem: UITabBarItem = tabBar.items![0]
        topItem.title = "フィード"
        let searchItem: UITabBarItem = tabBar.items![1]
        searchItem.title = "探す"
        let registrationItem: UITabBarItem = tabBar.items![2]
        registrationItem.title = "出品"
        let messageItem: UITabBarItem = tabBar.items![3]
        messageItem.title = "メッセージ"
        let mypageItem: UITabBarItem = tabBar.items![4]
        mypageItem.title = "マイページ"
    }

}
