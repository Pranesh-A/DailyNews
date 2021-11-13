//
//  NewsListContainerView+INewsListContainerView.swift
//  DailyNews
//
//  Created by Divum on 13/11/21.
//
import Foundation
extension NewsListContainerView: INewsListContainerView {
    func setupTableViewCellSetups() {
        tableViewCellSetups.append(getNewsTableViewCellSetup(0))
    }
    private func getNewsTableViewCellSetup(_ index: Int) -> NewsTableViewCellSetup {
        let newsTableViewCellSetup = NewsTableViewCellSetup(tableView: tableView, index: index, newsList: newsList)
        newsTableViewCellSetup.registerTableViewCell()
        return newsTableViewCellSetup
    }
}
