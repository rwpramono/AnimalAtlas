//
//  SearchPhotoResponse.swift
//  AnimalAtlas
//
//  Created by Rachmat Wahyu Pramono on 25/07/24.
//

import Foundation

// MARK: - SearchPhotoResponse
public struct SearchPhotoResponse: Codable {
    public let page, perPage: Int
    public let photos: [AnimalPhoto]
    public let totalResults: Int
    public let nextPage: String?

    public enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case photos
        case totalResults = "total_results"
        case nextPage = "next_page"
    }

    public init(page: Int, perPage: Int, photos: [AnimalPhoto], totalResults: Int, nextPage: String) {
        self.page = page
        self.perPage = perPage
        self.photos = photos
        self.totalResults = totalResults
        self.nextPage = nextPage
    }
}

// MARK: - Photo
public struct AnimalPhoto: Codable {
    public let id, width, height: Int
    public let url: String
    public let photographer: String
    public let photographerURL: String
    public let photographerID: Int
    public let avgColor: String
    public let src: PhotoSource
    public let liked: Bool
    public let alt: String

    public enum CodingKeys: String, CodingKey {
        case id, width, height, url, photographer
        case photographerURL = "photographer_url"
        case photographerID = "photographer_id"
        case avgColor = "avg_color"
        case src, liked, alt
    }

    public init(id: Int, width: Int, height: Int, url: String, photographer: String, photographerURL: String, photographerID: Int, avgColor: String, src: PhotoSource, liked: Bool, alt: String) {
        self.id = id
        self.width = width
        self.height = height
        self.url = url
        self.photographer = photographer
        self.photographerURL = photographerURL
        self.photographerID = photographerID
        self.avgColor = avgColor
        self.src = src
        self.liked = liked
        self.alt = alt
    }
}

// MARK: - PhotoSource
public struct PhotoSource: Codable {
    public let original, large2X, large, medium: String
    public let small, portrait, landscape, tiny: String

    public enum CodingKeys: String, CodingKey {
        case original
        case large2X = "large2x"
        case large, medium, small, portrait, landscape, tiny
    }

    public init(original: String, large2X: String, large: String, medium: String, small: String, portrait: String, landscape: String, tiny: String) {
        self.original = original
        self.large2X = large2X
        self.large = large
        self.medium = medium
        self.small = small
        self.portrait = portrait
        self.landscape = landscape
        self.tiny = tiny
    }
}
