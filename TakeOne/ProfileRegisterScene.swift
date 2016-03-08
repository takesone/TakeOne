//
//  ProfileRegisterScene.swift
//  TakeOne
//
//  Created by YuichiSawada on 3/7/16.
//  Copyright © 2016 YuichiSawada. All rights reserved.
//

import UIKit

class ProfileRegisterScene: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var profileImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        profileImageView.contentMode = .ScaleAspectFit
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
    
    /**
     ライブラリから写真を選択する
     */
    func pickImageFromLibrary() {
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {    //追記
            
            //写真ライブラリ(カメラロール)表示用のViewControllerを宣言しているという理解
            let controller = UIImagePickerController()
            
            //おまじないという認識で今は良いと思う
            controller.delegate = self
            
            //新しく宣言したViewControllerでカメラとカメラロールのどちらを表示するかを指定
            //以下はカメラロールの例
            //.Cameraを指定した場合はカメラを呼び出し(シミュレーター不可)
            controller.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            
            //新たに追加したカメラロール表示ViewControllerをpresentViewControllerにする
            self.presentViewController(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func onUploadPicture(sender: UIButton) {
        pickImageFromLibrary()
    }
    
    /**
     写真を選択した時に呼ばれる (swift2.0対応)
     
     :param: picker:おまじないという認識で今は良いと思う
     :param: didFinishPickingMediaWithInfo:おまじないという認識で今は良いと思う
     */
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo: [String: AnyObject]) {
        
        //このif条件はおまじないという認識で今は良いと思う
        if didFinishPickingMediaWithInfo[UIImagePickerControllerOriginalImage] != nil {
            
            //didFinishPickingMediaWithInfo通して渡された情報(選択された画像情報が入っている？)をUIImageにCastする
            //そしてそれを宣言済みのimageViewへ放り込む
            profileImageView.image = didFinishPickingMediaWithInfo[UIImagePickerControllerOriginalImage] as? UIImage
            
            
        }
        
        //写真選択後にカメラロール表示ViewControllerを引っ込める動作
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
}