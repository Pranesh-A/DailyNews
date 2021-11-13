//
//  NewsListViewController.swift
//  DailyNews
//
//  Created by Divum on 13/11/21.
//
import UIKit
class NewsListViewController: UIViewController {
    @IBOutlet weak var newsListContainerView: NewsListContainerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("loaded")
        setupNewsListContainerView()
    }
    private func setupNewsListContainerView() {
        newsListContainerView.setupNewsListContainerView()
    }
}
