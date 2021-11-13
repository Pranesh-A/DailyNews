//
//  NewsListContainerView.swift
//  DailyNews
//
//  Created by Divum on 13/11/21.
//
import UIKit
protocol INewsListContainerView {
    func setupTableViewCellSetups()
}
protocol NewsListContainerViewDelegate: class {
    func showNewsDetailScreen(_ selectedNews: NewsInfo)
    func refreshNews()
}
class NewsListContainerView: UIView {
    static let identifier = String(describing: NewsListContainerView.self)
    @IBOutlet var containerView: UIView!
    @IBOutlet weak var tableView: UITableView!
    weak var delegate: NewsListContainerViewDelegate?
    var tableViewCellSetups: [TableViewCellSetup] = []
    var newsList: [NewsInfo] = []
    var refreshControl = UIRefreshControl()
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    private func commonInit() {
        Bundle.main.loadNibNamed(NewsListContainerView.identifier, owner: self, options: nil)
        setupContainerView()
        setupTableView()
    }
    private func setupContainerView() {
        addSubview(containerView)
        containerView.frame = self.bounds
        containerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    func setupNewsListContainerView() {
        setupTableViewCellSetups()
        reloadTableView()
    }
    func refreshNewsListContainerView(_ newsList: [NewsInfo]) {
        self.newsList = newsList
        guard let newsTableViewCellSetup = tableViewCellSetups.filter({ $0.tableViewCellIdentifier == NewsTableViewCell.identifier }).first as? NewsTableViewCellSetup else { return }
        newsTableViewCellSetup.reloadViewWith(data: newsList)
        reloadTableView()
    }
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
        tableView.addSubview(refreshControl)
    }
    @objc func refresh(_ sender: AnyObject) {
        delegate?.refreshNews()
    }
    private func reloadTableView() {
        refreshControl.endRefreshing()
        tableViewCellSetups.sort(by: { $0.index < $1.index })
        tableView.reloadData()
    }
}
