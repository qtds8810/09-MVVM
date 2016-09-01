//
//  CustomHttp.swift
//  09-MVVM
//
//  Created by 左得胜 on 16/9/1.
//  Copyright © 2016年 左得胜. All rights reserved.
//

import Foundation

class  CustomHttp {
    
    //此处方法类似 JSON网络请求数据 (模拟
    static  func  GetJosnData()->[MyCustomClassModel]{
        var MyModel=[MyCustomClassModel]()
        for i in 1...60{
            let myModel: MyCustomClassModel = MyCustomClassModel(id: i,name: "自定义模拟JSON数据\(i)")
            MyModel.append(myModel)
        }
        return MyModel
    }
    
}
