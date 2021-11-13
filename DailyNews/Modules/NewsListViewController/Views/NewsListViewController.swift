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
        newsListContainerView.delegate = self
        newsListContainerView.setupNewsListContainerView()
    }
    private func setupNewsListViewModel() {
        newsListViewModel.delegate = self
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let newsDetailViewController: NewsDetailViewController = segue.destination as? NewsDetailViewController {
            newsDetailViewController.newsDetailViewModel.selectedNews = newsListViewModel.selectedNews
        }
    }
}
