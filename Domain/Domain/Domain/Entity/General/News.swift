//
//  News.swift
//  Domain
//
//  Created by Gilwan Ryu on 2020/02/26.
//  Copyright © 2020 GilwanRyu. All rights reserved.
//

import Foundation

// MARK: - News
public struct News: Codable {
    public let papers: [Paper]
    
    private enum CodingKeys: String, CodingKey {
        case papers = "Data"
    }
}

public struct Paper: Codable {
    public let id: String?
    public let guid: String?
    public let publishedOn: Int?
    public let imageurl: String?
    public let title: String?
    public let url: String?
    public let source: String?
    public let body: String?
    public let tags: String?
    public let categories: String?
    public let upvotes: String?
    public let downvotes: String?
    public let lang: String?
    public let sourceInfo: SourceInfo?

    private enum CodingKeys: String, CodingKey {
        case id
        case guid
        case publishedOn = "published_on"
        case imageurl
        case title
        case url
        case source
        case body
        case tags
        case categories
        case upvotes
        case downvotes
        case lang
        case sourceInfo = "source_info"
    }
}

public struct SourceInfo: Codable {
    public let name: String?
    public let lang: String?
    public let img: String?
}

// MARK: - NewsViewModel
public protocol PaperViewable {
    var id: String { get }
    var guid: String { get }
    var title: String { get }
    var url: String { get }
    var imageUrl: String { get }
    var body: String { get }
    var sourceName: String { get }
    var sourceImageUrl: String { get }
    var tags: String { get }
}

public struct PaperViewModel: PaperViewable {
    
    private let paper: Paper
    
    public init(paper: Paper) {
        self.paper = paper
    }
    
    public var id: String {
        return paper.id ?? ""
    }
    
    public var guid: String {
        return paper.guid ?? ""
    }
    
    public var title: String {
        return paper.title ?? ""
    }
    
    public var url: String {
        return paper.url ?? ""
    }
    
    public var imageUrl: String {
        return paper.imageurl ?? ""
    }
    
    public var body: String {
        return paper.body ?? ""
    }
    
    public var sourceName: String {
        return paper.sourceInfo?.name ?? ""
    }
    
    public var sourceImageUrl: String {
        return paper.sourceInfo?.img ?? ""
    }
    
    public var tags: String {
        return paper.tags ?? ""
    }
}
