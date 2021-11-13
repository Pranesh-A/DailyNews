//
//  News.swift
//  DailyNews
//
//  Created by Divum on 13/11/21.
//
import Foundation
import Alamofire
class NewsService {
    private static let sharedInstance = NewsService()
    private init () { }
    static func fetchNewsList(_ success: @escaping ((_ response: NewsListModel) -> Void), failure: @escaping (() -> Void)) {
        NewsService.sharedInstance.fetchNewsList({ newsListModel in success(newsListModel) }, { failure() })
    }
}
extension NewsService {
    private func fetchNewsList(_ success: @escaping ((_ response: NewsListModel) -> Void), _ failure: @escaping (() -> Void)) {
        let apiUrl = "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=d05743351f8a40099d4b1be32fb749a4"
        print("Calling -> \(apiUrl)")
        Alamofire.request(apiUrl, method: .get, encoding: JSONEncoding.default, headers: nil).validate().responseJSON { (alamofireResponse) in
            convertFromJSONToModelV4(alamofireResponse) { (data) -> NewsListModel? in
                do {
                    let newsListModel = try JSONDecoder().decode(NewsListModel.self,
                                                               from: data)
                    success(newsListModel)
                } catch {
                    print("Decode error: \(error)")
                }
                return nil
            } failure: {
                failure()
            }
        }
    }
}
