//
//  TodoListResponse.swift
//  Mission
//
//  Created by 김은지 on 2023/05/18.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let todoListResponse = try? JSONDecoder().decode(TodoListResponse.self, from: jsonData)

// MARK: - TodoListResponse
struct TodoListResponse: Decodable {
    let data: [Todo]?
    let meta: Meta?
    let message: String?
}

// MARK: - Datum
struct Todo: Decodable {
    let id: Int?
    let title: String?
    let isDone: Bool?
    let createdAt, updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id, title
        case isDone = "is_done"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

// MARK: - Meta
struct Meta: Decodable {
    let currentPage, from, lastPage, perPage: Int?
    let to, total: Int?

    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case from
        case lastPage = "last_page"
        case perPage = "per_page"
        case to, total
    }
}
