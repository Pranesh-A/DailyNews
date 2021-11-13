//
//  NewsTableViewCell.swift
//  DailyNews
//
//  Created by Divum on 13/11/21.
//
import UIKit
import SDWebImage
class NewsTableViewCell: UITableViewCell {
    static let identifier = String(describing: NewsTableViewCell.self)
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsDescriptionLabel: UILabel!
    @IBOutlet weak var newsAuthorLabel: UILabel!
    @IBOutlet weak var separatorView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func setupNewsTableViewCell(_ newsInfo: NewsInfo) {
        setupNewsImageView(newsInfo.urlToImage)
        setupNewsTitleLabel(newsInfo.title)
        setupNewsDescriptionLabel(newsInfo.description)
        setupAuthorLabel(newsInfo.author)
        setupSeparatorView()
    }
    private func setupNewsImageView(_ imageUrl: String) {
        newsImageView.contentMode = .scaleAspectFill
        guard let url = URL(string: imageUrl) else { return }
        newsImageView.sd_setImage(with: url, completed: nil)
    }
    private func setupNewsTitleLabel(_ title: String) {
        newsTitleLabel.textColor = UIColor.black
        newsTitleLabel.numberOfLines = 0
        newsTitleLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        newsTitleLabel.text = title
    }
    private func setupNewsDescriptionLabel(_ description: String) {
        newsDescriptionLabel.textColor = UIColor.black
        newsDescriptionLabel.numberOfLines = 0
        newsDescriptionLabel.font = UIFont.systemFont(ofSize: 12.0)
        newsDescriptionLabel.text = description
    }
    private func setupAuthorLabel(_ author: String) {
        newsAuthorLabel.textColor = UIColor.black
        newsAuthorLabel.textAlignment = .right
        newsAuthorLabel.font = UIFont.boldSystemFont(ofSize: 14.0)
        newsAuthorLabel.text = "- \(author)"
    }
    private func setupSeparatorView() {
        separatorView.backgroundColor = UIColor.black
    }
}
