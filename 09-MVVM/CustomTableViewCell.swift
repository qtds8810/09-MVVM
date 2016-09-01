//
//  CustomTableViewCell.swift
//  09-MVVM
//
//  Created by 左得胜 on 16/9/1.
//  Copyright © 2016年 左得胜. All rights reserved.
//

import UIKit

//自定义Cell的协议 每个Cell 自己拥有自己的协议类型（用于处理业务)
protocol PCustomTableViewCell {
    func click(vc: MainViewController,index indexpath: NSIndexPath, this: CustomTableViewCell)  //按钮点击
}

class CustomTableViewCell: UITableViewCell {
    /// 定义ViewModel协议
    private var delegate: PCustomTableViewCell?
    /// MVVM代码切分，将VC传过来
    private var mainVC: MainViewController?
    /// 控制器传入
    private var indexPath: NSIndexPath?
    
    //初始化
    func initConfig(model: MyCustomClassModel, indexPath: NSIndexPath?, main: MainViewController){
        self.mainVC = main
        self.delegate = main
        self.indexPath = indexPath
        myButton.frame=CGRectMake(0, 10, frame.width, 70)
        
        myButton.setTitle(model.name, forState: .Normal)
        contentView.addSubview(myButton)
    }
    
    func click(){
        delegate?.click(self.mainVC!, index: indexPath!, this: self)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    /// 懒加载myButton
    lazy var myButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.brownColor()
        btn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        
        btn.addTarget(self, action: #selector(self.click), forControlEvents: UIControlEvents.TouchUpInside)
        
        return btn
    }()
}
