//
//  ViewController.swift
//  TakeOne
//
//  Created by YuichiSawada on 3/6/16.
//  Copyright © 2016 YuichiSawada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //ログイン時のイメージ
    @IBOutlet weak var loginImageView: UIImageView!
    @IBOutlet weak var loginTitleImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //ログイン画面のバックグラウンドの画像
        let loginImage = UIImage(named: "logBg.png")
        loginImageView.image = loginImage
        //ログイン画面のロゴ画像
        let loginTitleImage = UIImage(named: "logo.png")
        loginTitleImageView.image = loginTitleImage
        
        //let titleOriSize = loginTitleImageView.frame
        let titleNewSize:CGRect = CGRectMake(0, 0, 100, 100)
        loginTitleImageView!.frame = titleNewSize
        //var titleImageSize = self.loginTitleImageView.image!.size
        //titleImageSize.height /= 2
        //titleImageSize.width /= 2
        //loginTitleImageView.image?.size.height = 10
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

