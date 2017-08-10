//
//  ViewController.swift
//  MVPDemo_Swift
//
//  Created by zyj on 16/5/9.
//  Copyright © 2016年 UIView. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,DataProtocol {
    
    @IBOutlet weak var tableView: UITableView!
    var dataPresenter = DataPresenter()     //接口对象
    var dataArr = []    //数据数组
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataPresenter.delegate = self
        //发送数据请求
        dataPresenter.sendRequestToDataModel()
    }
    
    //DataPrensenter代理方法
    func requestData(_ dict: NSDictionary) {
        self.dataArr = (dict["data"] as! NSArray) as! [Any]
        //刷新tableview
        self.tableView.reloadData()
    }
    
    //UITableView代理方法
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArr.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        cell.textLabel?.text = self.dataArr[indexPath.row]["photo_abstract"] as? String
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

