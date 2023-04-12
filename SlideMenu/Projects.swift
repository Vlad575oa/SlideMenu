//
//  Projects.swift
//  SlideMenu
//
//  Created by user on 12.04.2023.
//

import SwiftUI

struct Projects: View {
    var body: some View {
      VStack {
        LinearGradient(gradient: Gradient(colors: [.red, .yellow]), startPoint: .leading, endPoint: .trailing)
          .mask(
            Text("Projects").bold()
              .font(.title2)
            )
          .frame(width: 90, height: 90)
          .frame(maxWidth: .infinity, alignment: .leading )
        ForEach(projects) { item in
          HStack {
            Circle()
              .fill(item.color)
              .frame(width: 12, height: 12)
            Text(item.titel).bold()
              .font(.title3)
            Spacer()

          }
          .foregroundColor(.gray)

        }
      }
    }
}

struct Projects_Previews: PreviewProvider {
    static var previews: some View {
        Projects()
    }
}
