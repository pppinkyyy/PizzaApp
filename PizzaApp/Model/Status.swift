//
//  Status.swift
//  PizzaApp
//
//  Created by Alia on 13.02.2024.
//

import Foundation

enum OrderStatus: String, CaseIterable {
    case new = "Нове"
    case preparing = "Готується"
    case delivery = "Доставка"
    case completed = "Доставлено"
    case cancelled = "Скасовано"
}
