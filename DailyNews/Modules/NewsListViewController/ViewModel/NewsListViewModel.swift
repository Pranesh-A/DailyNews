//
//  NewsListViewModel.swift
//  DailyNews
//
//  Created by Divum on 13/11/21.
//
import Foundation
protocol INewsListViewModel { }
protocol NewsListViewModelDelegate: class { }
class NewsListViewModel {
    weak var delegate: NewsListViewModelDelegate?
}
