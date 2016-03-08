//
//  ProfileRegisterScene.swift
//  TakeOne
//
//  Created by YuichiSawada on 3/7/16.
//  Copyright © 2016 YuichiSawada. All rights reserved.
//

import UIKit

class ProfileRegisterScene: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onRegister(sender: UIButton) {
        //いまはとりあえずチュートリアルの設定を元に戻す（後で絶対消す）////////
        let LOGIN_MULTIPUL_TIME = "multipulTimeToUseThisApp"
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: LOGIN_MULTIPUL_TIME)
        NSUserDefaults.standardUserDefaults().synchronize()
        /////////////////////////////////////////////////////////////
    }
    @IBAction func onUploadPicture(sender: UIButton) {
        
    }
}