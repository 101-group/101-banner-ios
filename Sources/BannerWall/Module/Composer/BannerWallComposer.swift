//
//  BannerWallComposer.swift
//  101-connect
//
//  Created by incetro on 10/01/2022.
//  Copyright © 2022 Incetro Inc. All rights reserved.
//

import Foundation

// MARK: - BannerWallComposer

/// `BannerWall` module composer
///
/// `BannerWallComposer` is responsible for making `BannerWall` module instances.
/// You can choose a specification from `Specification` which defines your module type.
public final class BannerWallComposer {

    // MARK: - Properties

    /// Current composer instance
    private static let composer = BannerWallComposer()

    // MARK: - Composition

    /// Create a new `BannerWallView` instance for the given specification
    /// - Parameter json: json specification value
    /// - Returns: a new `BannerWallView` instance for the given specification
    public static func view(
        withJSON json: String,
        closeButtonTitle: String,
        onCloseButtonTap: BannerWallView.CloseActionBlock?,
        onActionButtonTap: BannerWallView.ActionButtonBlock?
    ) throws -> BannerWallView {
        BannerWallView(
            state: try state(withJSON: json),
            closeButtonTitle: closeButtonTitle,
            onCloseButtonTap: onCloseButtonTap,
            onActionButtonTap: onActionButtonTap
        )
    }

    /// Create a new `BannerWallStore` instance for the given specification
    /// - Parameter specification: target specification value
    /// - Returns: a new `BannerWallStore` instance for the given specification
    public static func state(withJSON json: String) throws -> BannerWallState {
        guard let data = json.data(using: .utf8) else {
            throw NSError(
                domain: "com.banner-wall",
                code: 1,
                userInfo: [
                    NSLocalizedDescriptionKey: "Cannot convert string '\(json)' to JSON"
                ]
            )
        }
        return try JSONDecoder().decode(BannerWallState.self, from: data)
    }
}
