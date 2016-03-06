//
//  TutorialViewController.swift
//  TakeOne
//
//  Created by YuichiSawada on 3/7/16.
//  Copyright © 2016 YuichiSawada. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate{
    let LOGIN_FIRST_TIME = "isFirstTimeToUseThisApp"    //はじめてのログインかどうかをチェックするkey
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
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: LOGIN_FIRST_TIME)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func onNext(){
        if(pageControll.currentPage < self.imeges.count-1){
            print ("click next button");
            var frame: CGRect = self.scrollView.bounds
            frame.origin.x = frame.size.width * CGFloat(pageControll.currentPage+1)
            pageControll.currentPage += 1
            frame.origin.y = 0
            self.scrollView.scrollRectToVisible(frame, animated: true)
        }
    }
    
    func onBack(){
        if(pageControll.currentPage > 0){
            print ("click back button");
            var frame: CGRect = self.scrollView.bounds
            frame.origin.x = frame.size.width * CGFloat(pageControll.currentPage-1)
            pageControll.currentPage -= 1
            frame.origin.y = 0
            self.scrollView.scrollRectToVisible(frame, animated: true)
        }
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        //スクロール数がページ一ページ分になった時
        if fmod(scrollView.contentOffset.x, scrollView.frame.maxX) == 0{
            pageControll.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.maxX)
        }
    }
    
    func isTutorialDone() ->Bool{
        let isLogined: Bool = NSUserDefaults.standardUserDefaults().boolForKey(LOGIN_FIRST_TIME)
        return !isLogined
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
