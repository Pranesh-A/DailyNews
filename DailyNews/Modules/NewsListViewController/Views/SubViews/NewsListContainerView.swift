//
//  NewsListContainerView.swift
//  DailyNews
//
//  Created by Divum on 13/11/21.
//
import UIKit
class NewsListContainerView: UIView {
    static let identifier = String(describing: NewsListContainerView.self)
    @IBOutlet var containerView: UIView!
    @IBOutlet weak var tableView: UITableView!
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
    func setupNewsListContainerView() { }
    private func setupTableView() {
//        tableView.delegate = self
//        tableView.dataSource = self
    }
    private func reloadTableView() {
//        tableViewCellSetups.sort(by: { $0.index < $1.index })
//        tableView.reloadData()
    }
}
