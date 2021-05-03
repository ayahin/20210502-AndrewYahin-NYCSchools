//
//  MainView.swift
//  NYCSchools
//
//  Created by Andrew Yahin on 4/30/21.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var schoolsViewModel: SchoolsViewModel
    
    var body: some View {
        
        NavigationView {
            ZStack(alignment: .center) {
                if schoolsViewModel.status == .available {
                    ScrollView {
                        LazyVStack(spacing: 0) {
                            Divider()
                            ForEach(schoolsViewModel.schools) { school in
                                NavigationLink(destination: SchoolDetails(schoolDetails:
                                                        DetailsViewModel(school: school,
                                                                         scores: schoolsViewModel.scores(for: school.dbn),
                                                                    scoreStatus: schoolsViewModel.scoresStatus))) {
                                    SchoolCellView(school: school,
                                                   scores: schoolsViewModel.scores(for: school.dbn),
                                                   scoresStatus: schoolsViewModel.scoresStatus)
                                }
                            }
                        }
                    }
                }
                else {
                    ScrollView {
                        LazyVStack(spacing: 0) {
                            StatusView(status: schoolsViewModel.status)
                        }}
                }
            }
            .navigationBarTitle(Text("NYC Schools"))
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(schoolsViewModel: SchoolsViewModel())
    }
}
