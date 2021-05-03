//
//  SchoolCellView.swift
//  NYCSchools
//
//  Created by Andrew Yahin on 5/2/21.
//

import SwiftUI

struct SchoolCellView: View {
    var school: School
    var scores: Scores?
    var scoresStatus: LoadStatus
    
    var body: some View {
        VStack {
            Text(school.school_name ?? "no name").padding()
            ScoresStatusView(scores: scores, scoresStatus: scoresStatus)
            Divider()
        }
        .foregroundColor(Color(.black))
    }
}

struct ScoresStatusView: View {
    var scores: Scores?
    var scoresStatus: LoadStatus
    
    var body: some View {
        VStack {
            if scoresStatus == .available && scores == nil {
                Label(LoadStatus.empty.description(name: "Scores"), systemImage: LoadStatus.empty.systemImage)
                    .imageScale(.small)
                    .foregroundColor(LoadStatus.empty.style.color)
            }
            else {
                Label(scoresStatus.description(name: "Scores"), systemImage: scoresStatus.systemImage)
                    .imageScale(.small)
                    .foregroundColor(scoresStatus.style.color)
            }
        }
        .foregroundColor(Color(.black))
    }
}

struct SchoolCellView_Previews: PreviewProvider {
    static var previews: some View {
        SchoolCellView(school: School(dbn: "dbn", school_name: "school name", overview_paragraph: "overview", phone_number: "phone", school_email: "email", location: "location", website: "web"), scoresStatus: .loading)
    }
}
