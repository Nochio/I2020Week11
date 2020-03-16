//
//  ViewController.swift
//  CustomCellCemo
//
//  Created by Thomas Hinrichs on 13/03/2020.
//  Copyright © 2020 Thomas Hinrichs. All rights reserved.
//
import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var stories = [Story]()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stories.append(Story(txt: "Hi there", img: ""))
        stories.append(Story(txt: "How are you doin", img: "car1"))
        stories.append(Story(txt: "Nice cat there", img: "car2"))
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if stories[indexPath.row].hasImage(){
            if let cell = tableView.dequeueReusableCell(withIdentifier: "cell2") as? TableViewCellTaxtAndImage {
                cell.mySecondLabel.text = stories[indexPath.row].text
                cell.myImageView.image = UIImage(named: stories[indexPath.row].image)
                return cell
            }
        }else{
            if let cell = tableView.dequeueReusableCell(withIdentifier: "cell1") as? TableViewCellTextOnly{
                cell.myLabel.text = stories[indexPath.row].text
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return stories[indexPath.row].hasImage() ? 200 : 80
    }

}

