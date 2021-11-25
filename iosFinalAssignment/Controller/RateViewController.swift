//
//  RateViewController.swift
//  iosFinalAssignment
//
//  Created by TENZIN TSELHA on 11/1/21.
//

//import UIKit
//import CoreData
//
//class RateViewController: UIViewController {
//
//    var items : [NSManagedObject] = []
//    @IBOutlet weak var rateTableView: UITableView!
//    
//    var itemList : [Item]?
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        title = "Your List"
//        rateTableView.register(UITableViewCell.self, forCellReuseIdentifier: "rateCell")
//    }
//    override func viewWillAppear(_ animated: Bool) {
//      
//        super.viewWillAppear(animated)
//        
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
//            return
//        }
//        
//        let Context = appDelegate.persistentContainer.viewContext
//        
//        let fetch = NSFetchRequest<NSManagedObject>(entityName: "SaveWorthy")
//        
//        do {
//            items = try
//            Context.fetch(fetch)
//        }
//        catch _ as NSError {
//            print("Error")
//        }
//        
//        // Do any additional setup after loading the view.
//    }
//    
//    func save(itemName: String){
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
//            return
//        }
//        
//        let Context = appDelegate.persistentContainer.viewContext
//        
//        let entity = NSEntityDescription.entity(forEntityName: "Item", in: Context)!
//        
//        let changes = NSManagedObject(entity:entity, insertInto: Context)
//        
//        Item.setValue(itemName, forKeyPath: "itemName")
//        
//        do {
//            try Context.save()
//            items.append(changes)
//        }catch _ as NSError {
//            print("Error!")
//    
//        }
//    }
//
//    @IBAction func addButton(_ sender: UIBarButtonItem) {
//        let notify = UIAlertController(title: "New Item", message: "Add a new item", preferredStyle: .alert)
//        
//        let save = UIAlertAction(title:"save", style: .default){
//            [unowned self] action in
//            guard let textField = notify.textFields?.first,
//                  let itemSave = textField.text
//            else {
//                return
//            }
//            self.save(itemName: itemSave)
//            self.rateTableView.reloadData()
//        }
//        let cancel = UIAlertAction(title: "cancel", style: .cancel)
//            notify.addTextField()
//        notify.addAction(save)
//        notify.addAction(cancel)
//        
//        present(notify, animated:true)
//        
//    }
//    
//}
//extension RateViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return items.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let item = items[indexPath.row]
//        let cell = rateTableView.dequeueReusableCell(withIdentifier: "rateCell",for:indexPath)
//        cell.textLabel?.text = item.value(forKeyPath: "itemName") as? String
//        return cell
//    }
//}
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}
//












