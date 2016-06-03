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
        productImageView.contentMode = .ScaleAspectFit
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /**
     製品の画像選択ボタンが押された時
     */
    @IBAction func onSelectPicture(sender: UIButton) {
       pickImageFromLibrary()
    }
    
    /**
     ライブラリから写真を選択する
     */
    func pickImageFromLibrary() {
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {
            let controller = UIImagePickerController()
            controller.delegate = self
            controller.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            presentViewController(controller, animated: true, completion: nil)
            //self.presentViewController(controller, animated: true, completion: nil)
            print("画像選日開始");
        }
    }

    
    /**
     写真を選択した時に呼ばれる (swift2.0対応)
     */
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo: [String: AnyObject]) {
        if let image = didFinishPickingMediaWithInfo[UIImagePickerControllerOriginalImage] as? UIImage {
            productImageView.image = image
        }
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
}
