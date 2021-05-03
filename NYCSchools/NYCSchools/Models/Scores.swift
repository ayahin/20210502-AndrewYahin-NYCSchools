//
//  Scores.swift
//  NYCSchools
//
//  Created by Andrew Yahin on 5/2/21.
//

import Foundation

struct Scores : Decodable {
    let dbn: String?
    let num_of_sat_test_takers: String?
    let sat_critical_reading_avg_score: String?
    let sat_math_avg_score: String?
    let sat_writing_avg_score: String?
}
