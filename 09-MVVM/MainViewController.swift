//
//  MainViewController.swift
//  09-MVVM
//
//  Created by 左得胜 on 16/9/1.
//  Copyright © 2016年 左得胜. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    let initIdentifier = "Cell"
    
    var myModel: [MyCustomClassModel]! {
        didSet {
            myTableView.reloadData()
        }
    }
    
    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 获取请求的数据，这里必须先获取数据，再创建UI
        myModel = CustomHttp.GetJosnData()
        
        setupUI()
        
    }
    
    private func setupUI() {
        // 设置
        navigationItem.title = "MVVM框架搭建测试"
        
        // 添加控件
        view.addSubview(myTableView)
        
        // 布局控件
        myTableView.frame = view.frame
        
        // 设置
    }
    
    /// 懒加载myTableView
    private lazy var myTableView: UITableView = {
        let tv = UITableView(frame: CGRectZero, style: UITableViewStyle.Plain)
        tv.delegate = self
        tv.dataSource = self
        tv.rowHeight = 80
        tv.tableFooterView = UIView()
        tv.registerClass(CustomTableViewCell.self, forCellReuseIdentifier: self.initIdentifier)
        
        return tv
    }()
    
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myModel!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(initIdentifier, forIndexPath: indexPath) as! CustomTableViewCell
        
        cell.initConfig(myModel[indexPath.row], indexPath: indexPath, main: self)
        cell.accessoryType = UITableViewCellAccessoryType.None
        
        return cell
    }
}
