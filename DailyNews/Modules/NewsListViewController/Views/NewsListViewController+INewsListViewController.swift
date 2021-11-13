//
//  NewsListViewController+INewsListViewController.swift
//  DailyNews
//
//  Created by Divum on 13/11/21.
//
import Foundation
extension NewsListViewController: INewsListViewController {
    func getNewsList() {
        displayActivityIndicator(shouldDisplay: true)
        newsListViewModel.getNewsList()
    }
}
