//
//  NewsListModel.swift
//  DailyNews
//
//  Created by Divum on 13/11/21.
//
import Foundation
struct NewsListModel: Codable {
    @DecodableDefault.EmptyString var status: String
    @DecodableDefault.EmptyInt var totalResults: Int
    @DecodableDefault.EmptyList var articles: [NewsInfo]
}
struct NewsInfo: Codable {
    var source: Source
    @DecodableDefault.EmptyString var author: String
    @DecodableDefault.EmptyString var title: String
    @DecodableDefault.EmptyString var description: String
    @DecodableDefault.EmptyString var url: String
    @DecodableDefault.EmptyString var urlToImage: String
    @DecodableDefault.EmptyString var publishedAt: String
    @DecodableDefault.EmptyString var content: String
}

struct Source: Codable {
    @DecodableDefault.EmptyString var id: String
    @DecodableDefault.EmptyString var name: String
}
