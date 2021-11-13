//
//  NewsListViewController+NewsListViewModel.swift
//  DailyNews
//
//  Created by Divum on 13/11/21.
//
import Foundation
extension NewsListViewController: NewsListViewModelDelegate {
    func getNewsListSuccessResponse() {
        displayActivityIndicator(shouldDisplay: false)
        newsListContainerView.refreshNewsListContainerView(newsListViewModel.newsListModel.articles)
    }
    func getNewsListFailureResponse() {
        displayActivityIndicator(shouldDisplay: false)
    }
}
