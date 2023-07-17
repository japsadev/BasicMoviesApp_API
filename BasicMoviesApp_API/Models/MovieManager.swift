//
//  MovieManager.swift
//  BasicMoviesApp_API
//
//  Created by Salih Yusuf Göktaş on 17.07.2023.
//

import Foundation

struct MovieManager {
	func fetchMovies(completion: @escaping(MovieModel) -> ()) {
		guard let url = URL(string: "https://reactnative.dev/movies.json") else { return }
		let dataTask = URLSession.shared.dataTask(with: url) { data, _, error in
			if let error = error {
				print(error.localizedDescription)
			}
			
			//MARK: DECODİNG
			guard let jsonData = data else { return }
			
			let decoder = JSONDecoder()
			do {
				let decodedData = try decoder.decode(MovieModel.self, from: jsonData)
				completion(decodedData)
			} catch {
				print("Error to decoding data.")
			}
		}
		dataTask.resume()
	}
}
