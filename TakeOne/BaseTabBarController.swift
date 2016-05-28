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
        let formSB = UIStoryboard(name: "Form", bundle: nil)
        
        // はじめに呼び出されるべきところを定義する
        let formVC = formSB.instantiateInitialViewController()!
        
        // 読み込むビューを定義する
        viewControllers = [
        formVC,
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
        let formItem: UITabBarItem = tabBar.items![0]
        formItem.title = "Form"
    }
    



}
