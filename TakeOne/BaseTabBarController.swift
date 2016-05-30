//
//  BaseTabBarController.swift
//  TakeOne
//
//  Created by YasuhiroWada on 2016/05/27.
//  Copyright © 2016年 YuichiSawada. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 呼びたいストーリーボードを定義
         // TODO: 新しいビューができたら名前変更
        let mypageSB = UIStoryboard(name: "Mypage", bundle: nil)
        let messageSB = UIStoryboard(name: "Message", bundle: nil)
        let registrationSB = UIStoryboard(name: "Registration", bundle: nil)
        let searchSB = UIStoryboard(name: "Search", bundle: nil)
        let topSB = UIStoryboard(name: "Top", bundle: nil)
        
        // はじめに呼び出されるべきところを定義する
        let mypageVC = mypageSB.instantiateInitialViewController()!
        let messageVC = messageSB.instantiateInitialViewController()!
        let registrationVC = registrationSB.instantiateInitialViewController()!
        let searchVC = searchSB.instantiateInitialViewController()!
        let topVC = topSB.instantiateInitialViewController()!
        // 読み込むビューを定義する(配下)
        viewControllers = [
        mypageVC,
        messageVC,
        registrationVC,
        searchVC,
        topVC,
        ]
        
        setupTabBar()
        
        //一番はじめに開かれるビューコントローラーの設定
        selectedIndex = 0

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    private func setupTabBar() {
        let mypageItem: UITabBarItem = tabBar.items![0]
        mypageItem.title = "Mypage"
        let messageItem: UITabBarItem = tabBar.items![1]
        messageItem.title = "Message"
        let registrationItem: UITabBarItem = tabBar.items![2]
        registrationItem.title = "Registration"
        let searchItem: UITabBarItem = tabBar.items![3]
        searchItem.title = "Search"
        let topItem: UITabBarItem = tabBar.items![4]
        topItem.title = "Top"
    }
    



}
