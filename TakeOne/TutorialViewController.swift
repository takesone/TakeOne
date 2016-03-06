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
        
        //一度チュートリアルを見たということを保存
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: LOGIN_FIRST_TIME)
        NSUserDefaults.standardUserDefaults().synchronize()
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
