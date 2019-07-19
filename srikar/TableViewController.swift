//
//  ViewController.swift
//  srikar
//
//  Created by epita on 01/07/2019.
//  Copyright © 2019 epita. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {
    
    var userArray: [Contact]?
    var selectedCell : Contact?

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        fetchUsers()
    }
    
    override func prepare(for seque: UIStoryboardSegue, sender: Any?){
        super.prepare(for: seque, sender: sender)
        guard let detailViewController = seque.destination as? DetailViewController else {
            return
        }
        detailViewController.contact = selectedCell
    }

    func fetchUsers(){
        var request = URLRequest(url: URL(string: "https://randomuser.me/api/?results=10&seed=poralla")!)
        
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil {
                print("Network error", error)
                return
            }
            
            do{
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(ListInfo.self, from: data!)
                self.userArray = responseModel.results
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                print(responseModel)
            } catch let error {
                print("JSON Serialization ERROR: ", error)
            }
            }.resume()
    }
    
    func formatName(userName: ContactName) -> String {
        return userName.title.capitalized + " " + userName.first.capitalized + " " + userName.last.uppercased()
    }
    
}

extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "userCell") as? MainTableViewCell else {
            return UITableViewCell()
        }
        if let user = userArray?[indexPath.row] {
            let fullName = formatName(userName: user.name)
            cell.lableUName.text = fullName
            cell.lableUEmail.text = user.email
            let data : Data = try! Data(contentsOf: URL(string:(user.picture.thumbnail))!)
            cell.contactImage.image = UIImage(data: data)
            cell.contactImage.layer.cornerRadius = cell.contactImage.frame.height/2
            print(cell.contactImage.frame.height/2)
        }
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            
        }
        else {
            cell.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            
        }
        return cell
    }
    
    
}

extension TableViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCell = userArray![indexPath.row]
        performSegue(withIdentifier:  "FullDetails", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
