//
//  CustomViewModel.swift
//  09-MVVM
//
//  Created by 左得胜 on 16/9/1.
//  Copyright © 2016年 左得胜. All rights reserved.
//

import Foundation
import UIKit

extension MainViewController: PCustomTableViewCell{
    
    func click(vc: MainViewController, index indexpath: NSIndexPath, this: CustomTableViewCell) {
        // 修改当前View
        this.myButton.setTitle("我已经被点击过了", forState: UIControlState.Normal)
        // 对数据对象集合操作
        myModel[indexpath.row].name = "我已经被点击过了"
    }
    
}
