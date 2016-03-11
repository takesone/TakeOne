//
//  ProductRegisterScene.swift
//  TakeOne
//
//  Created by YuichiSawada on 3/10/16.
//  Copyright © 2016 YuichiSawada. All rights reserved.
//

import UIKit

class ProductRegisterScene: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var productImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        productImageView.contentMode = .ScaleAspectFit
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /**
     製品の画像選択ボタンが押された時
     */
    @IBAction func onSelectPicture(sender: UIButton) {
       pickImageFromLibrary()
        //self.presentViewController(selectPic, animated: false, completion: nil)
    }
    
    /**
     ライブラリから写真を選択する
     */
    func pickImageFromLibrary() {
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {
            
            //写真ライブラリ(カメラロール)表示用のViewControllerを宣言しているという理解
            let controller = UIImagePickerController()
            
            //コールバックが変える先を示していると思う
            controller.delegate = self
            
            //新しく宣言したViewControllerでカメラとカメラロールのどちらを表示するかを指定
            //以下はカメラロールの例
            //.Cameraを指定した場合はカメラを呼び出し(シミュレーター不可)
            controller.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            
            //新たに追加したカメラロール表示ViewControllerをpresentViewControllerにする
            self.presentViewController(controller, animated: true, completion: nil)
            //self.presentViewController(controller, animated: true, completion: nil)
            print("画像選日開始");
        }
    }

    
    /**
     写真を選択した時に呼ばれる (swift2.0対応)
     */
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo: [String: AnyObject]) {
        print("画像えらんだ？");
        if didFinishPickingMediaWithInfo[UIImagePickerControllerOriginalImage] != nil {
            //そしてそれを宣言済みのimageViewへ放り込む
            // profileImageView.image = didFinishPickingMediaWithInfo[UIImagePickerControllerOriginalImage] as? UIImage
            print("画像選択済み");
            //画像が存在した場合
            productImageView.image = didFinishPickingMediaWithInfo[UIImagePickerControllerOriginalImage] as? UIImage
        }
        //写真選択後にカメラロール表示ViewControllerを引っ込める動作
        picker.dismissViewControllerAnimated(true, completion: nil)        
    }
}
