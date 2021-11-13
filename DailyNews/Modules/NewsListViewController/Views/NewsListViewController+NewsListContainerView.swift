//
//  NewsListViewController+NewsListContainerView.swift
//  DailyNews
//
//  Created by Divum on 13/11/21.
//
import Foundation
extension NewsListViewController: NewsListContainerViewDelegate {
    func showNewsDetailScreen(_ selectedNews: NewsInfo) {
        newsListViewModel.selectedNews = selectedNews
    }
}
