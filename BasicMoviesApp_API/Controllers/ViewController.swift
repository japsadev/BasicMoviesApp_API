//
//  ViewController.swift
//  BasicMoviesApp_API
//
//  Created by Salih Yusuf Göktaş on 17.07.2023.
//

import UIKit

class ViewController: UITableViewController {

	//MARK: PROPERTİES
	let resuableIdentifier = "tableViewCell"
	let movieManager = MovieManager()
	var myMovie: [Movies]? {
		didSet {
			tableView.reloadData()
		}
	}
	
	//MARK: LIFE CYCLE
	override func viewDidLoad() {
		super.viewDidLoad()
		configureTableView()
		
		movieManager.fetchMovies { (movies) in
		DispatchQueue.main.async { [self] in
		navigationItem.title = movies.title
		}
		self.myMovie = movies.movies
		}
		}
	
	func configureTableView() {
		view.backgroundColor = .black
		tableView.tableFooterView = UIView()
	}

}
	
extension ViewController {
		override func numberOfSections(in tableView: UITableView) -> Int {
			return myMovie?.count ?? 0
		}
		
		override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
			let cell = tableView.dequeueReusableCell(withIdentifier: resuableIdentifier, for: indexPath)
			guard let movie = myMovie?[indexPath.row] else { return UITableViewCell()}
			cell.textLabel?.text = "\(movie.title) -- \(movie.releaseYear)"
			return cell
	}

}

