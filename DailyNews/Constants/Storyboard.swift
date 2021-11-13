//
//  Storyboard.swift
//  DailyNews
//
//  Created by Divum on 13/11/21.
//
import Foundation
enum Storyboard {
    case newsList, newsDetail
    var name: String {
        switch self {
        case .newsList: return "NewsList"
        case .newsDetail: return "NewsDetail"
        }
    }
}
