//
//  TableViewController.swift
//  connecty
//
//  Created by 공대생 on 2021/02/05.
//

import UIKit

//cell등록하려고 필요한 reusable identifier
private let reusableIdentifier = "cell" //tableview extension dequeue

class TableViewController: UITableViewController{
    
    let items = ["1","2","3","4","5","6","7","8"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    func configure(){
        tableView.register(PostCell.self, forCellReuseIdentifier: reusableIdentifier)
    }
}

//dataSource, Delegate

extension TableViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //indexPath는 해당 셀이 몇 번째 셀인지 알려줌
        let cell = tableView.dequeueReusableCell(withIdentifier: reusableIdentifier, for: indexPath) as! PostCell
        let item = self.items[indexPath.row]
        cell.item = item
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 3{
            return 200
        }else{
            return 100
        }
    }
}
