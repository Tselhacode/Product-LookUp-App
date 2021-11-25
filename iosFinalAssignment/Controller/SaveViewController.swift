//
//  SaveViewController.swift
//  iosFinalAssignment
//
//  Created by TENZIN TSELHA on 11/10/21.
//

import UIKit
import CoreData

class SaveViewController: UIViewController {
    var itemList : [StoreItem]?
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var context : NSManagedObjectContext!
    @IBOutlet weak var itemNameDisplay: UILabel!
    @IBOutlet weak var brandNameDisplay: UILabel!
    var obj : StoreItem?
    var itemName : String = ""
    var brandName : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        itemNameDisplay.text = itemName
        brandNameDisplay.text = brandName
    }
    
    func openCoreData(){
        context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Item", in: context)
        let newItem = NSManagedObject(entity: entity!, insertInto: context)
        saveData(itemObj:newItem)
    }
    
    func saveData(itemObj:NSManagedObject)
    {
        itemObj.setValue(itemName,forKey:"itemName")
        itemObj.setValue(brandName,forKey:"brandName")
        print("15.storing data")
        do {
            try context.save()
            print("16.saved")
        }
        catch{
            print("17.Failed Saving")
        }
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        openCoreData()
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
