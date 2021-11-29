//
//  adaptive.swift
//  adaptive
//
//  Created by lan on 2021/11/28.
//

import SwiftUI

struct AdaptiveView<Content: View>: View {
  @State private var availableWidth: CGFloat = 0
  var threshold: CGFloat
  var content: Content

  public init(
    threshold: CGFloat,
    @ViewBuilder content: () -> Content
  ) {
    self.threshold = threshold
    self.content = content()
  }

  var body: some View {
    ZStack {
      Color.clear
        .frame(height: 1)
        .readSize { size in
          availableWidth = size.width
        }

      if availableWidth > threshold {
        HStack {
          content
        }
      } else {
        VStack {
          content
        }
      }
    }
  }
}
