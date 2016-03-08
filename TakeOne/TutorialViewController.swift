//
//  TutorialViewController.swift
//  TakeOne
//
//  Created by YuichiSawada on 3/7/16.
//  Copyright © 2016 YuichiSawada. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate{
    let LOGIN_MULTIPUL_TIME = "multipulTimeToUseThisApp"    //はじめてのログインかどうかをチェックするkey
    var scrollView: UIScrollView!    //スクロールビュー
    var pageControll: UIPageControl! //ページコントロール
    var imeges: [String] = ["cH1.png", "cH2.png", "cH3.png"]   //チュートリアルの画像保管
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenW = self.view.frame.maxX
        let screenH = self.view.frame.maxY
        let pageNum = self.imeges.count
        
        //scrollviewの作成
        scrollView = UIScrollView(frame: self.view.frame)
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.pagingEnabled = true
        scrollView.delegate = self
        scrollView.contentSize = CGSizeMake(CGFloat(pageNum) * screenW, screenH)
        self.view.addSubview(self.scrollView)
        
        //各ページの作成
        for var i = 0; i < pageNum; i++ {
            let img: UIImage = UIImage(named:self.imeges[i])!
            let uiView: UIImageView = UIImageView(image: img)
            uiView.frame = CGRect(x:CGFloat(i) * screenW, y: 0, width: screenW, height: screenH)
            scrollView.addSubview(uiView)
        }
        
        //ページコントローラーの作成
        self.pageControll = UIPageControl(frame: CGRectMake(0, screenH-50, screenW, 50))
        self.pageControll.numberOfPages = pageNum
        self.pageControll.currentPage = 0
        self.pageControll.userInteractionEnabled = false
        self.view.addSubview(self.pageControll)
        
        //ボタンの追加
        let nextButton = UIButton(frame: CGRectMake(screenW/3, screenH-50, screenW/3*2, 50))
        nextButton.backgroundColor = UIColor.orangeColor()
        nextButton.addTarget(self, action: "onNext", forControlEvents: .TouchUpInside)
        nextButton.setTitle("Next", forState: UIControlState.Normal)
        nextButton.layer.masksToBounds = true
        self.view.addSubview(nextButton)
        //backボタンの追加
        let backButton = UIButton(frame: CGRectMake(0, screenH-50, screenW/3, 50))
        backButton.backgroundColor = UIColor.grayColor()
        backButton.addTarget(self, action: "onBack", forControlEvents: .TouchUpInside)
        backButton.setTitle("Back", forState: UIControlState.Normal)
        backButton.layer.masksToBounds = true
        self.view.addSubview(backButton)
        
        //一度チュートリアルを見たということを保存
        NSUserDefaults.standardUserDefaults().setBool(true, forKey: LOGIN_MULTIPUL_TIME)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    /// 次へ行くボタンを押された時
    func onNext(){
        if(pageControll.currentPage < self.imeges.count-1){
            //最後のページじゃなかった時
            print ("click next button");
            var frame: CGRect = self.scrollView.bounds
            frame.origin.x = frame.size.width * CGFloat(pageControll.currentPage+1)
            pageControll.currentPage += 1
            frame.origin.y = 0
            self.scrollView.scrollRectToVisible(frame, animated: true)
        }else if(pageControll.currentPage == self.imeges.count - 1){
            //チュートリアルの最後のページに来た時
            print("go to next page");
            
            //画面移動(今はとりあえずプロファイルのページに移動)
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let profileView: ProfileRegisterScene = sb.instantiateViewControllerWithIdentifier("id_profileRegisterVC") as! ProfileRegisterScene
            self.presentViewController(profileView, animated: true, completion:nil)
        }
    }
    
    /// バックボタンを押された時
    func onBack(){
        if(pageControll.currentPage > 0){
            //最初のページじゃなかった時
            print ("click back button");
            var frame: CGRect = self.scrollView.bounds
            frame.origin.x = frame.size.width * CGFloat(pageControll.currentPage-1)
            pageControll.currentPage -= 1
            frame.origin.y = 0
            self.scrollView.scrollRectToVisible(frame, animated: true)
        }
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        if(pageControll.currentPage == imeges.count-1){
            //最後のページでスクロールした時
            //画面移動(今はとりあえずプロファイルのページに移動)
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let profileView: ProfileRegisterScene = sb.instantiateViewControllerWithIdentifier("id_profileRegisterVC") as! ProfileRegisterScene
            self.presentViewController(profileView, animated: true, completion:nil)
            return
        }
        
        if fmod(scrollView.contentOffset.x, scrollView.frame.maxX) == 0{
            pageControll.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.maxX)
        }
        
        
    }
    
    /// チュートリアルをみたことがあるかないか
    /// true もう見た
    /// false まだ見てない
    func isTutorialDone() ->Bool{
        let isLogined: Bool = NSUserDefaults.standardUserDefaults().boolForKey(LOGIN_MULTIPUL_TIME)
        print("is logined : @", isLogined)
        return isLogined
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
