//
//  NewsDetailViewController.swift
//  DailyNews
//
//  Created by Divum on 13/11/21.
//
import UIKit
class NewsDetailViewController: UIViewController {
    @IBOutlet weak var newsDetailContainerView: NewsDetailContainerView!
    var newsDetailViewModel = NewsDetailViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNewsDetailContainerView()
    }
    private func setupNewsDetailContainerView() {
        newsDetailContainerView.setupNewsDetailContainerView(newsDetailViewModel.selectedNews.url)
    }
}
