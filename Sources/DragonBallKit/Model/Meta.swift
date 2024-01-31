import Foundation

public struct Meta: Codable {
    public var totalItems: Int
    public var itemCount: Int
    public var itemsPerPage: Int
    public var totalPages: Int
    public var currentPage: Int
}
