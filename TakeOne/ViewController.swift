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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let loginImage = UIImage(named: "logBg.png")
        loginImageView.image = loginImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

