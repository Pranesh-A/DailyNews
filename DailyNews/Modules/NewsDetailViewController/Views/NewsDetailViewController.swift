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
        setupNavigationBar()
        setupNewsDetailContainerView()
    }
    private func setupNavigationBar() {
        let button = UIBarButtonItem(image: UIImage(named: "crossIcon")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(closeIconClicked))
        navigationItem.leftBarButtonItem = button
    }
    private func setupNewsDetailContainerView() {
        newsDetailContainerView.setupNewsDetailContainerView(newsDetailViewModel.selectedNews.url)
    }
    @objc private func closeIconClicked() {
        dismiss(animated: true, completion: nil)
    }
}
