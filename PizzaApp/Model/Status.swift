//
//  Status.swift
//  PizzaApp
//
//  Created by Alia on 13.02.2024.
//

import Foundation

enum OrderStatus: String, CaseIterable {
    case new = "Новий"
    case preparing = "Готується"
    case delivery = "Доставляється"
    case completed = "Готово"
    case cancelled = "Скасований"
}
