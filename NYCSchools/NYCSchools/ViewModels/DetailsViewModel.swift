//
//  DetailsViewModel.swift
//  NYCSchools
//
//  Created by Andrew Yahin on 5/2/21.
//

import SwiftUI

class DetailsViewModel : ObservableObject {
    
    var school: School?
    var scores: Scores?
    @Published var scoreStatus: LoadStatus
    
    init(school: School?, scores: Scores?, scoreStatus: LoadStatus) {
        self.school = school
        self.scores = scores
        self.scoreStatus = scoreStatus
    }
}
