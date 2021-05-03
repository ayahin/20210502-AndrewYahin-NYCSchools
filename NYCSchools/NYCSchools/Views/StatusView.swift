//
//  LoadStatusView.swift
//  NYCSchools
//
//  Created by Andrew Yahin on 5/2/21.
//

import SwiftUI

struct StatusView: View {
    var status: Status
    
    var body: some View {
        VStack {
            Spacer(minLength: 100.0)
            if let systemImage = status.systemImage {
                Label("", systemImage: systemImage)
                    .imageScale(.large)
                    .foregroundColor(status.style.color)
                Spacer()
            }
            Text(status.description(name: "Schools"))
                .font(.custom("Open Sans", size: 20))
                .foregroundColor(status.style.color)
            Spacer(minLength: 100.0)
        }
    }
}

struct StatusView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Divider()
            StatusView(status: LoadStatus.loading)
            Divider()
            StatusView(status: LoadStatus.available)
            Divider()
            StatusView(status: LoadStatus.empty)
            Divider()
            StatusView(status: LoadStatus.failed)
            Divider()
        }
    }
}
