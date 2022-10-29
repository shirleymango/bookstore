//
//  DetailsViewController.swift
//  BookStore
//
//  Created by ZhuMacPro on 10/28/22.
//  Copyright © 2022 Apple. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!

    var bookTitle = ""
    var ID = ""
    var author = ""
        
    override func viewDidLoad() {
        super.viewDidLoad()
        print(bookTitle)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let bookCell = tableView.dequeueReusableCell(withIdentifier: "bookTableViewCell") as! BookTableViewCell
        if (indexPath.row == 0) {
            bookCell.bookFeature.text = "ID"
            bookCell.bookFeatureValue.text = ID
        }
        else if (indexPath.row == 1) {
            bookCell.bookFeature.text = "Author"
            bookCell.bookFeatureValue.text = author
        }
        else if (indexPath.row == 2) {
            bookCell.bookFeature.text = "Title"
            bookCell.bookFeatureValue.text = bookTitle
        }
        return bookCell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
