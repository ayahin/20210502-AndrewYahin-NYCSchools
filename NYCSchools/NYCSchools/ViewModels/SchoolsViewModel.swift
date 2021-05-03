//
//  SchoolsViewModel.swift
//  NYCSchools
//
//  Created by Andrew Yahin on 5/2/21.
//

import SwiftUI

class SchoolsViewModel : ObservableObject {
    
    
    @Published var status: LoadStatus = .loading
    @Published var scoresStatus: LoadStatus = .loading
    
    var schools: [School] = []
    var scores: [String:Scores] = [:]
    
    func scores(for dbn: String?) -> Scores? {
        guard let dbn = dbn else { return nil }
        
        return scores[dbn]
    }
    
    init() {
        SchoolsViewModel.loadSchools() { (result, error)  in
            if let _ = error {
                self.status = .failed
                self.schools = []
            }
            if let result = result?.filter({ !($0.school_name ?? "").isEmpty }), result.count > 0 {
                self.schools = result
                self.status = .available
            }
            else {
                self.status = .empty
                self.schools = []
            }
        }
        
        SchoolsViewModel.loadScores() { (result, error)  in
            self.scores = [:]
            if let _ = error {
                self.scoresStatus = .failed
            }
            if let result = result?.filter({ !($0.dbn ?? "").isEmpty }), result.count > 0 {
                for score in result {
                    self.scores[score.dbn!] = score
                }
                self.scoresStatus = .available
            }
            else {
                self.scoresStatus = .empty
            }
        }
    }
    
    static func loadSchools(complete: @escaping ([School]?, NYCError?)->()) {
        
        guard let url = URL(string: "https://data.cityofnewyork.us/resource/s3k6-pzi2.json") else {
            DispatchQueue.main.async {
                complete(nil, NYCError.networkError)
            }
            return
        }
        DispatchQueue.global().async {
        let task = URLSession.shared.dataTask(with: url) {
            (data: Data?, response: URLResponse?, error: Error?) -> Void in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    complete(nil, NYCError.networkError)
                }
                return
            }
            guard let schools: [School] = try? JSONDecoder().decode([School].self, from: data) else {
                DispatchQueue.main.async {
                    complete(nil, NYCError.conversionError)
                }
                return
            }
            
            DispatchQueue.main.async {
                complete(schools, nil)
            }
        }
        task.resume()
        }
    }
    
    
    static func loadScores(complete: @escaping ([Scores]?, NYCError?)->()) {
        
        guard let url = URL(string: "https://data.cityofnewyork.us/resource/f9bf-2cp4.json") else {
            DispatchQueue.main.async {
                complete(nil, NYCError.networkError)
            }
            return
        }
        DispatchQueue.global().async {
        let task = URLSession.shared.dataTask(with: url) {
            (data: Data?, response: URLResponse?, error: Error?) -> Void in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    complete(nil, NYCError.networkError)
                }
                return
            }
            guard let scores: [Scores] = try? JSONDecoder().decode([Scores].self, from: data) else {
                DispatchQueue.main.async {
                    complete(nil, NYCError.conversionError)
                }
                return
            }
            
            DispatchQueue.main.async {
                complete(scores, nil)
            }
        }
        task.resume()
        }
    }
}
