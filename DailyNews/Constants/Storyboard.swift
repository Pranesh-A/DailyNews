//
//  Storyboard.swift
//  DailyNews
//
//  Created by Divum on 13/11/21.
//
import Foundation
import Foundation
enum Storyboard {
    case newsList
    var name: String {
        switch self {
        case .newsList: return "NewsList"
        }
    }
}
