//
//  DetailViewController.swift
//  srikar
//
//  Created by epita on 18/07/2019.
//  Copyright © 2019 epita. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var contact: Contact?

    @IBOutlet weak var LabelTitle: UILabel!
    @IBOutlet weak var LabelStreet: UILabel!
    @IBOutlet weak var LabelCity: UILabel!
    @IBOutlet weak var LabelEmail: UILabel!
    @IBOutlet weak var LabelPhone: UILabel!
    @IBOutlet weak var LabelCell: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPage()

    }
    func formatName(userName: ContactName) -> String {
        return userName.title.capitalized + " " + userName.first.capitalized + " " + userName.last.uppercased()
    }
    func loadPage(){
        let name = formatName(userName: contact!.name)
        LabelTitle.text = name
        LabelStreet.text = contact?.location.street
        LabelCity.text = contact?.location.city
        LabelEmail.text = contact?.email
        LabelPhone.text = contact?.phone
        LabelCell.text = contact?.cell
        let data : Data = try! Data(contentsOf: URL(string:(contact?.picture.large)!)!)
        image.image = UIImage(data: data)
    }
        

        
}
