//
//  TableViewCell.swift
//  iosFinalAssignment
//
//  Created by TENZIN TSELHA on 10/31/21.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var tableView: UITableView!

 
   
    //when the tableView loads up, it is going to request for a DataSource
    //self here is referencing the ViewController and trigger the delegate methods
    override func awakeFromNib() {
        super.awakeFromNib()
        tableView.dataSource = self
        tableView.delegate = self
        // Initialization code
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Do any additional setup after loading the view.
    }

}
//use delegation
extension TableViewCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listImage.count
    }
    //indexPath is the position
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //create a cell and return it to the tableview
        //returns a reusable cell object for the specified reused identifier and adds it to the table
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.cellIdentifier, for: indexPath)
        cell.textLabel?.text = listImage[indexPath.row].key
            return cell
        }
    }

extension TableViewCell: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.cellIdentifier, for: indexPath)
        ServiceController.shared.fetchDataFromServer(myURL:listImage[indexPath.row].value) {
            (result) in
            Thread.sleep(forTimeInterval: 2)
            switch result {
            case .failure(let error):
                print("error")
            case .success(let image):
            DispatchQueue.main.async{
                self.photo!.image = image
                }
        }
        
    }
}

}



import CoreData

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var cellPressed: UIButton!
    @IBOutlet weak var brandName: UILabel!
    @IBOutlet weak var itemName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        tableView.dataSource = self
        tableView.delegate = self
    }
    

    @IBAction func cellBtnPressed(_ sender: UIButton) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let itemToSave = SaveWorthy(context: context)
        SaveTableViewCell.shared.SaveItemLabel.text = itemToSave.itemName
        itemToSave.favorite = true
        
        self.savedItems()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func savedItems() {
        do {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            try context.save()
        }catch{
            print("Not able to save\(error)")
            
        }
        
    }

}
