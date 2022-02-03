//
//  BannerWallView.swift
//  101-connect
//
//  Created by incetro on 10/01/2022.
//  Copyright © 2022 Incetro Inc. All rights reserved.
//

import SwiftUI

// MARK: - BannerWallView

/// A visual representation of `BannerWall` module.
/// Here we define the view that displays the feature.
public struct BannerWallView: View {

    // MARK: - Aliases

    /// onAppear event block alias
    public typealias OnAppear = () -> Void

    /// Close button block alias
    public typealias CloseActionBlock = () -> Void

    /// Action button block alias
    public typealias ActionButtonBlock = (BannerWallState) -> Void

    // MARK: - Properties

    @State
    private var showWebView = false

    /// `BannerWallState` instance
    private let state: BannerWallState

    /// Close button title value
    private let closeButtonTitle: String

    /// Closure that calls when view appears
    private let onAppear: OnAppear?

    /// Closure that calls when we tap on the close button
    private let onCloseButtonTap: CloseActionBlock?

    /// Closure that calls when we tap on the action button
    private let onActionButtonTap: ActionButtonBlock?

    // MARK: - Initializers

    /// Default initializer
    /// - Parameters:
    ///   - store: BannerWallState instance
    public init(
        state: BannerWallState,
        closeButtonTitle: String,
        onAppear: OnAppear? = nil,
        onCloseButtonTap: CloseActionBlock? = nil,
        onActionButtonTap: ActionButtonBlock? = nil
    ) {
        self.state = state
        self.onAppear = onAppear
        self.closeButtonTitle = closeButtonTitle
        self.onCloseButtonTap = onCloseButtonTap
        self.onActionButtonTap = onActionButtonTap
    }

    // MARK: - View

    public var body: some View {
        ZStack {

            LinearGradient(
                colors: [
                    state.firstBackgroundColor.color,
                    state.secondBackgroundColor.color
                ],
                startPoint: .top,
                endPoint: .bottom
            ).edgesIgnoringSafeArea(.all)

            VStack {

                HStack {
                    Button {
                        onCloseButtonTap?()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(.black.opacity(0.38))
                    }
                    .frame(width: 24, height: 24)
                    .padding(12)
                    Spacer()
                }

                Text(state.title)
                    .foregroundColor(state.textColor.color)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 34, weight: .bold))
                    .padding([.leading, .trailing], 12)
                    .padding(.bottom, 2)

                Text(state.definition)
                    .foregroundColor(state.textColor.color)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 17, weight: .medium))
                    .padding([.leading, .trailing], 12)
                    .padding(.bottom, 12)

                if let data = state.imageData, let image = UIImage(data: data) {
                    Rectangle()
                        .padding(12)
                        .overlay(
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                                .clipShape(RoundedRectangle(cornerRadius: 13, style: .continuous))
                                .frame(maxWidth: UIScreen.main.bounds.width)
                        )
                        .frame(maxWidth: UIScreen.main.bounds.width - 24)
                        .background(Color.yellow)
                        .clipShape(RoundedRectangle(cornerRadius: 13, style: .continuous))
                }

                Spacer()

                Button {
                    if state.buttonLink != nil {
                        showWebView = true
                    }
                    onActionButtonTap?(state)
                } label: {
                    Text(state.buttonTitle)
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(state.buttonTextColor.color)
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .background(
                            RoundedRectangle(cornerRadius: 13, style: .continuous)
                                .fill(state.buttonColor.color)
                        )
                }
                .padding(12)
            }
        }
        .onAppear {
            onAppear?()
        }
        .sheet(isPresented: $showWebView) {
            NavigationView {
                WebView(url: state.buttonLink.unsafelyUnwrapped)
                    .navigationBarItems(leading: HStack {
                        Button(closeButtonTitle) {
                            showWebView = false
                        }
                        Spacer()
                    })
                    .navigationBarTitle("", displayMode: .inline)
                    .edgesIgnoringSafeArea(.bottom)
            }
        }
    }
}
