//
//  FeedTableView.swift
//  TakeOne
//
//  Created by Kusumoto Masahiro on 2016/06/03.
//  Copyright © 2016年 YuichiSawada. All rights reserved.
//

import UIKit

class FeedTableView: UITableView, UITableViewDataSource, UITableViewDelegate {
    
    var showChatViewController: (()->Void)?
    
    // テストアイテム
    let testItem = ["TEST1", "TEST2", "TEST3"]
    
    override func awakeFromNib() {
        delegate = self
        dataSource = self
        
        backgroundColor = UIColor.clearColor()
        contentInset.bottom = 8
        rowHeight = UITableViewAutomaticDimension
        
        registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
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
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        cell.textLabel?.text = "sample"
        return cell
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
}