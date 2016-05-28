//
//  FormTableView.swift
//  TakeOne
//
//  Created by YasuhiroWada on 2016/05/24.
//  Copyright © 2016年 YuichiSawada. All rights reserved.
//

import UIKit

class FormTableView: UITableView , UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate {
    
    var showChatViewController: (()->Void)?
    
    // テストアイテム
    let testItem = ["TEST1", "TEST2", "TEST3"]
    
    override func awakeFromNib() {
    delegate = self
    dataSource = self
    
    let nib: UINib = UINib(nibName: "FormImage", bundle: nil)
    registerNib(nib, forCellReuseIdentifier: "FormImage")
    let nib2: UINib = UINib(nibName: "OtherChatTableViewCell", bundle: nil)
    registerNib(nib2, forCellReuseIdentifier: "OtherChatTableViewCell")
    
    separatorColor = UIColor.clearColor()
    backgroundColor = UIColor.clearColor()
    contentInset.bottom = 8
    rowHeight = UITableViewAutomaticDimension
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath:NSIndexPath) {
    if let showChatViewController = showChatViewController {
    showChatViewController()
    }
    }
    
    // MARK: - UITableViewDataSource Methods -
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return testItem.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("FormImageTableViewCell") as! FormImageTableViewCell
            return cell
        }
    return UITableViewCell() // inValid
    }
    
    // MARK: - UITableViewDelegate Methods -
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 0
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    return 0
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return UITableViewAutomaticDimension
    }
    
    // MARK: - UIScrollViewDelegate Methods -
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
    }
    


    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
