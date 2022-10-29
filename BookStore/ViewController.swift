//
//  ViewController.swift
//  BookStore
//

import UIKit

@available(iOS 13.0, *)
class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var collectionView: UICollectionView!
    
    var dict: Books?
    
    struct Books: Decodable {
        var books: [Book] = Array()
    }
    public struct Book: Decodable {
        enum Category: String, Decodable {
            case swift, combine, debugging, xcode
        }

        let id: String
        let title: String
        let author: String
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: (view.frame.size.width/3),
                                 height: (view.frame.size.width/3))
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(BookCollectionViewCell.self, forCellWithReuseIdentifier: BookCollectionViewCell.identifier)
        collectionView.collectionViewLayout = layout

        let url = URL(string:"http://localhost:8000/books.json")!
        let task = URLSession.shared.dataTask(with:url) { (data, response, error) in
            if error != nil {
               print(error!)
            }
            else {
                let JSON = String(data: data!, encoding: .utf8)!
                let jsonData = JSON.data(using: .utf8)!
                self.dict = try! JSONDecoder().decode(Books.self, from: jsonData)
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dict?.books.count ?? 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let bookCell = collectionView.dequeueReusableCell(withReuseIdentifier: BookCollectionViewCell.identifier, for: indexPath) as! BookCollectionViewCell
        if(self.dict != nil) {
            let imageURLString = "http://localhost:8000/" + (self.dict?.books[indexPath.row].id)! + ".jpg"
            bookCell.configure(imageURLString: imageURLString)
        }
        return bookCell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("tapped!")
        let vc = storyboard?.instantiateViewController(identifier: "DetailsViewController") as? DetailsViewController
        vc?.bookTitle = dict?.books[indexPath.row].title ?? "Untitled"
        vc?.ID = (dict?.books[indexPath.row].id)!
        vc?.author = (dict?.books[indexPath.row].author)!
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}

