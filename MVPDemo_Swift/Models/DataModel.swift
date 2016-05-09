//
//  DataModel.swift
//  MVPDemo_Swift
//
//  Created by zyj on 16/5/9.
//  Copyright © 2016年 UIView. All rights reserved.
//

import UIKit

typealias reqeustClosure = (NSDictionary) -> Void   //闭包

class DataModel: NSObject {
    
    static let dataSingleton = DataModel()  //单例
    var result: reqeustClosure?
    
    //初始化方法为私有，才能保证单例是真正唯一的
    private override init() {
        
    }
    
    func setRequestResult(requsetResult: reqeustClosure) {
        self.result = requsetResult
        //设置请求
        let url = NSURL(string: "http://182.254.231.237/interface/banner.php?action=getBanner")!
        let data = NSData(contentsOfURL: url)!
        let dict = try?NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers)
        //请求结果
        if self.result != nil {
            if dict != nil {
                self.result!(dict as! NSDictionary)
            }else {
                let errorDict = ["error":"request error!"]
                self.result!(errorDict)
            }
        }
    }
}
