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
        //ログイン画面のバックグラウンドの画像
        let loginImage = UIImage(named: "logBg")
        loginImageView.image = loginImage
        //ログイン画面のロゴ画像
        let loginTitleImage = UIImage(named: "logo")
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
    }

    @IBAction func onClickFacebookLogin(sender: UIButton) {
        let tutorial = TutorialViewController()
        if (!tutorial.isTutorialDone()) {
            self.presentViewController(tutorial, animated: true, completion: nil)
        } else {
            //let profileView: ProfileRegisterScene = self.storyboard?.instantiateViewControllerWithIdentifier("id_profileRegisterVC") as! ProfileRegisterScene
            //画面移動(今はとりあえずプロファイルのページに移動)
            let sb = UIStoryboard(name: "ProfileRegister", bundle: nil)
            let profileView: ProfileRegisterScene = sb.instantiateViewControllerWithIdentifier("id_profileRegisterVC") as! ProfileRegisterScene
            self.presentViewController(profileView, animated: true, completion:nil)

        }
    }

}

