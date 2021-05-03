//
//  NYCSchoolsApp.swift
//  NYCSchools
//
//  Created by Andrew Yahin on 4/30/21.
//

import SwiftUI

@main
struct NYCSchoolsApp: App {
    var body: some Scene {
        WindowGroup {
            MainView(schoolsViewModel: SchoolsViewModel())
        }
    }
}
