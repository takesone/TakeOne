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
    @IBOutlet weak var loginWithFacebookButton: UIButton!
    @IBOutlet weak var loginSignupButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //ログイン画面のバックグラウンドの画像
        let loginImage = UIImage(named: "logBg.png")
        loginImageView.image = loginImage
        //ログイン画面のロゴ画像
        let loginTitleImage = UIImage(named: "logo.png")
        loginTitleImageView.image = loginTitleImage
        //ログインボタンの見た目を角丸にする
        loginWithFacebookButton.layer.cornerRadius = 10
        //サインアップのボタン
        loginSignupButton.layer.borderWidth = 2
        loginSignupButton.layer.borderColor = UIColor.whiteColor().CGColor
        loginSignupButton.layer.cornerRadius = 10
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

