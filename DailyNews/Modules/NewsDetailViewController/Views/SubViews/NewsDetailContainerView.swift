//
//  NewsDetailContainerView.swift
//  DailyNews
//
//  Created by Divum on 13/11/21.
//
import UIKit
import WebKit
class NewsDetailContainerView: UIView {
    static let identifier = String(describing: NewsDetailContainerView.self)
    @IBOutlet var containerView: UIView!
    @IBOutlet weak var webView: WKWebView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    private func commonInit() {
        Bundle.main.loadNibNamed(NewsDetailContainerView.identifier, owner: self, options: nil)
        setupContainerView()
    }
    private func setupContainerView() {
        addSubview(containerView)
        containerView.frame = self.bounds
        containerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    func setupNewsDetailContainerView(_ urlString: String) {
        setupWebView(urlString)
    }
    private func setupWebView(_ urlString: String) {
        webView.backgroundColor = UIColor.white
        if let url = URL(string: urlString) {
            webView.load(URLRequest(url: url))
        }
    }
}
