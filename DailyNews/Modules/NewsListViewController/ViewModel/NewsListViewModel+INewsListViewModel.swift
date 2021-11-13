//
//  NewsListViewModel+INewsListViewModel.swift
//  DailyNews
//
//  Created by Divum on 13/11/21.
//
import Foundation
extension NewsListViewModel: INewsListViewModel {
    func getNewsList() {
        NewsService.fetchNewsList { (newsListModel) in
            self.newsListModel = newsListModel
            self.delegate?.getNewsListSuccessResponse()
        } failure: {
            self.delegate?.getNewsListFailureResponse()
        }
    }
}
