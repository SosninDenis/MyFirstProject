//
//  NewsTableViewController.swift
//  ChatALittle
//
//  Created by Денис Соснин on 03.02.2022.
//

import UIKit

class NewsTableViewController: UITableViewController {
    
    
    var newsArray: [ServerNewsModel] = []
    var service = Service()
    var views: [Int] = []
    let a = 0
    @IBOutlet var newsTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableViewCells()
        getData()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 550
    }
    
    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    func getData() {
        service.reguest { codabelData in
            self.newsArray = codabelData
            self.tableView.reloadData()
            print(codabelData, "Fetch")
            for _ in 0...self.newsArray.count - 1 {
                self.views.append(self.a)
            }
        }
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCellId", for: indexPath) as! NewsTableViewCell
        cell.newsTextLable.text = newsArray[indexPath.row].title
        cell.setupUIImage(imageName: newsArray[indexPath.row].url)
        
        let timeCounters = views[indexPath.row] + 1
        views[indexPath.row] = timeCounters
        cell.setupNumbersOfViews(number: String(timeCounters))
        return cell
    }
}

private extension NewsTableViewController {
    func registerTableViewCells() {
        tableView.register(NewsTableViewCell.nib(), forCellReuseIdentifier: "NewsTableViewCellId")
    }
}
