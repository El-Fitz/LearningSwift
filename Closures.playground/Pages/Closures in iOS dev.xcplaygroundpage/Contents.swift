//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

import UIKit

let someLabal = UILabel()

UIView.animate(withDuration: 1.0, animations: {
	someLabal.alpha = 0.3
}, completion: { failure in
	// Done, maybe failed
})


let label = UILabel()

func getRecentBlogPost(completion: @escaping (URLResponse) -> Void) {
	let session = URLSession(configuration: .default)
	let url = NSURL(string: "http://blog.teamtreehouse.com/api/get_recent_summary?count=20")!
	let request = NSURLRequest(url: url as URL)
	
	let dataTask = session.dataTask(with: request as URLRequest) { data, response, error in
		// Execute body of closure
		completion(response!)
	}
	
	dataTask.resume()
}

getRecentBlogPost(completion: { response in
	print("Completion: \(response)")
})

