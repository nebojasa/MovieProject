//
//  MTAPIClient.swift
//  MovieTumble
//
//  Created by Christopher Webb-Orenstein on 3/21/17.
//  Copyright © 2017 Christopher Webb-Orenstein. All rights reserved.
//

import Foundation

typealias JSON = [String : Any]

enum Response {
    case success(JSON), badURL(Error), badData(Error), badJSON(Error)
}


class MTAPIClient {
    
    
    static func search(for query: String?, forPage page: String, completion: @escaping (_ results: MTSearchResults?) -> Void) {
        let session = URLSession(configuration: .ephemeral)
        if let encodedQuery = query?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed),  let url = URL(string:"http://www.omdbapi.com/?s=\(encodedQuery)&page=\(page)") {
            let request = URLRequest(url: url)
            var movies = [MTMovie]()
            
            session.dataTask(with: request) { data, response, error in
                let json = convertDataToJSON(data)
                guard let search = json?["Search"] as? [[String : String]] else { return }
                for movie in 1..<search.count {
                    if let newMovie = MTMovie(search[movie]) {
                        movies.append(newMovie)
                    }
                }
                let results = MTSearchResults(movies: movies,
                                              totalResults: "200",
                                              response: .success(json!))
                completion(results) }.resume()
        }
    }
    
    
    
    static func convertDataToJSON(_ data: Data?) -> JSON? {
        guard let data = data else { return nil }
        do {
            return try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? JSON
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}

