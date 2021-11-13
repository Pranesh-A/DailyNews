//
//  NewsListContainerView+UITableView.swift
//  DailyNews
//
//  Created by Divum on 13/11/21.
//
import Foundation
import UIKit
extension NewsListContainerView: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        tableViewCellSetups.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        getTableViewData(section)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableViewCellSetups[indexPath.section].createTableViewCell(indexPath: indexPath)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let newsTableViewCellSetup: NewsTableViewCellSetup = tableViewCellSetups[indexPath.section] as? NewsTableViewCellSetup else { return }
        let news = newsTableViewCellSetup.newsList[indexPath.row]
        delegate?.showNewsDetailScreen(news)
    }
    private func getTableViewData(_ section: Int) -> Int {
        if let newsTableViewCellSetup = tableViewCellSetups[section] as? NewsTableViewCellSetup {
            return newsTableViewCellSetup.newsList.count
        }
        return 0
    }
}
