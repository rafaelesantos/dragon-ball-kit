import Foundation
import RefdsShared

public struct MetaModel: RefdsModel {
    public var totalItems: Int
    public var itemCount: Int
    public var itemsPerPage: Int
    public var totalPages: Int
    public var currentPage: Int
}
