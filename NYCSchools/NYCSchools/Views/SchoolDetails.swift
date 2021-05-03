//
//  SchoolDetails.swift
//  NYCSchools
//
//  Created by Andrew Yahin on 5/2/21.
//

import SwiftUI

struct SchoolDetails: View {
    
    var schoolDetails: DetailsViewModel
    
    var body: some View {
        List {
            if let name = schoolDetails.school?.school_name {
                Section(header: Text("School Name")) {
                    Text(name).padding()
                }
            }
            
            Section(header: Text("SAT Scores")) {
                ScoresStatusView(scores: schoolDetails.scores, scoresStatus: schoolDetails.scoreStatus)
            
                if let scores = schoolDetails.scores, schoolDetails.scoreStatus == .available {
                    Text("Number of test takers: \(scores.num_of_sat_test_takers ?? "Undefined")").padding()
                    Text("Critical reading average: \(scores.sat_critical_reading_avg_score ?? "Undefine")").padding()
                    Text("Math average: \(scores.sat_math_avg_score ?? "Undefined")").padding()
                    Text("Writing average: \(scores.sat_writing_avg_score ?? "Undefined")").padding()
                }
            }
            
            if let description = schoolDetails.school?.overview_paragraph {
                Section(header: Text("About")) {
                    Text(description).padding()
                }
            }
            
            if let location = schoolDetails.school?.location {
                Section(header: Text("Address")) {
                    Text(location).padding()
                }
            }
            
            if let web = schoolDetails.school?.website {
                Section(header: Text("Website")) {
                    Text(web).padding()
                }
            }
            
            if let email = schoolDetails.school?.school_email {
                Section(header: Text("Email")) {
                    Text(email).padding()
                }
            }
            
            if let phone = schoolDetails.school?.phone_number {
                Section(header: Text("Phone")) {
                    Text(phone).padding()
                }
            }
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle(Text("School Details"), displayMode: .inline)
    }
}

struct SchoolDetails_Previews: PreviewProvider {
    static var previews: some View {
        SchoolDetails(schoolDetails: DetailsViewModel(school: nil, scores: nil, scoreStatus: .loading))
    }
}
