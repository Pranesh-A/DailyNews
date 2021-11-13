//
//  NewsListViewModel.swift
//  DailyNews
//
//  Created by Divum on 13/11/21.
//
import Foundation
protocol INewsListViewModel {
    func getNewsList()
}
protocol NewsListViewModelDelegate: class {
    func getNewsListSuccessResponse()
    func getNewsListFailureResponse()
}
class NewsListViewModel {
    weak var delegate: NewsListViewModelDelegate?
    var newsListModel: NewsListModel!
}
