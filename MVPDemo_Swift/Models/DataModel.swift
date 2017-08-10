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
    fileprivate override init() {
        
    }
    
    func setRequestResult(_ requsetResult: @escaping reqeustClosure) {
        self.result = requsetResult
        //设置请求
        let url = URL(string: "http://182.254.231.237/interface/banner.php?action=getBanner")!
        let data = try! Data(contentsOf: url)
        let dict = try?JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)
        //请求结果
        if self.result != nil {
            if dict != nil {
                self.result!(dict as! NSDictionary)
            }else {
                let errorDict = ["error":"request error!"]
                self.result!(errorDict as NSDictionary)
            }
        }
    }
}
