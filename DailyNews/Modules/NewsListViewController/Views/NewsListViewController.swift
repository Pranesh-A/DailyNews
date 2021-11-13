//
//  NewsListViewController.swift
//  DailyNews
//
//  Created by Divum on 13/11/21.
//
import UIKit
protocol INewsListViewController {
    func getNewsList()
}
class NewsListViewController: UIViewController {
    @IBOutlet weak var newsListContainerView: NewsListContainerView!
    var newsListViewModel = NewsListViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNewsListContainerView()
        setupNewsListViewModel()
        getNewsList()
    }
    private func setupNewsListContainerView() {
        newsListContainerView.setupNewsListContainerView()
    }
    private func setupNewsListViewModel() {
        newsListViewModel.delegate = self
    }
}
