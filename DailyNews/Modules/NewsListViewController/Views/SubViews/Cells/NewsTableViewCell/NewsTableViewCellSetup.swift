//
//  NewsTableViewCellSetup.swift
//  DailyNews
//
//  Created by Divum on 13/11/21.
//
import Foundation
import UIKit
class NewsTableViewCellSetup: TableViewCellSetup {
    var tableView: UITableView
    var tableViewCellIdentifier: String = NewsTableViewCell.identifier
    var index: Int
    var newsList: [NewsInfo]
    init(tableView: UITableView, index: Int, newsList: [NewsInfo]) {
        self.tableView = tableView
        self.index = index
        self.newsList = newsList
    }
    func createTableViewCell(indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellIdentifier, for: indexPath)
        guard let newsTableViewCell = cell as? NewsTableViewCell else { return cell }
        newsTableViewCell.setupNewsTableViewCell(newsList[indexPath.row])
        return newsTableViewCell
    }
    func reloadViewWith<T>(data: T) {
        guard let newsList: [NewsInfo] = data as? [NewsInfo] else { return }
        self.newsList = newsList
    }
}
