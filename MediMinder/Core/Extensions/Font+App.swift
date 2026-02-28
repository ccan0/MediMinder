//
//  Font+App.swift
//  MediMinder
//

import SwiftUI

extension Font {
    enum Urbanist {
        static func light(_ size: CGFloat) -> Font {
            .custom("Urbanist-Light", size: size)
        }

        static func regular(_ size: CGFloat) -> Font {
            .custom("Urbanist-Regular", size: size)
        }

        static func medium(_ size: CGFloat) -> Font {
            .custom("Urbanist-Medium", size: size)
        }

        static func semiBold(_ size: CGFloat) -> Font {
            .custom("Urbanist-SemiBold", size: size)
        }

        static func bold(_ size: CGFloat) -> Font {
            .custom("Urbanist-Bold", size: size)
        }
    }
}
