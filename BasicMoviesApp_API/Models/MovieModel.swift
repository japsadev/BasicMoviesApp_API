//
//  MovieModel.swift
//  BasicMoviesApp_API
//
//  Created by Salih Yusuf Göktaş on 17.07.2023.
//

import Foundation


struct MovieModel : Decodable {
	let title: String
	let decription: String
	let movies: [Movies]
}

struct Movies : Decodable {
	let id: String
	let title: String
	let releaseYear: String
}
