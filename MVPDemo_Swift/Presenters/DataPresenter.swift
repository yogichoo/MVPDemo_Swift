//
//  DataPresenter.swift
//  MVPDemo_Swift
//
//  Created by zyj on 16/5/9.
//  Copyright © 2016年 UIView. All rights reserved.
//

import UIKit

protocol DataProtocol: NSObjectProtocol {
    
    func requestData(_ dict: NSDictionary)
    
}

class DataPresenter: NSObject {
    
    weak var delegate: DataProtocol?
    
    func sendRequestToDataModel() {
        DataModel.dataSingleton.setRequestResult { (dict: NSDictionary) -> Void in
            self.delegate?.requestData(dict)
        }
    }

}
