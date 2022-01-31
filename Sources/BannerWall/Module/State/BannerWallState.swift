//
//  BannerWallState.swift
//  101-connect
//
//  Created by incetro on 10/01/2022.
//  Copyright © 2022 Incetro Inc. All rights reserved.
//

import Foundation

// MARK: - BannerWallState

/// `BannerWall` module state
///
/// Basically, `BannerWallState` is a type that describes the data
/// `BannerWall` feature needs to perform its logic and render its UI.
public struct BannerWallState: Equatable, Codable {

    // MARK: - Properties

    /// Banner title
    public let title: String

    /// Banner description
    public let definition: String

    /// Link which will be used when taps on banner's button
    public let buttonLink: URL?

    /// Image data representation
    public var imageData: Data?

    /// Action button title
    public let buttonTitle: String

    /// Gradient's first color
    public let firstBackgroundColor: String

    /// Gradient's second color
    public let secondBackgroundColor: String

    /// Color for text which will be above
    /// the `firstBackgroundColor` place
    public let textColor: String

    /// Action button color
    public let buttonColor: String

    /// Action button text color
    public let buttonTextColor: String

    // MARK: - Initializers

    public init(
        title: String,
        definition: String,
        buttonLink: URL?,
        imageData: Data?,
        buttonTitle: String,
        firstBackgroundColor: String,
        secondBackgroundColor: String,
        textColor: String,
        buttonColor: String,
        buttonTextColor: String
    ) {
        self.title = title
        self.definition = definition
        self.buttonLink = buttonLink
        self.buttonTitle = buttonTitle
        self.imageData = imageData
        self.firstBackgroundColor = firstBackgroundColor
        self.secondBackgroundColor = secondBackgroundColor
        self.textColor = textColor
        self.buttonColor = buttonColor
        self.buttonTextColor = buttonTextColor
    }
}
