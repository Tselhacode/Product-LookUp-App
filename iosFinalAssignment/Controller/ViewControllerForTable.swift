//
//  ViewControllerForTable.swift
//  iosFinalAssignment
//
//  Created by TENZIN TSELHA on 11/2/21.
//
import UIKit
class ViewControllerForTable: UIViewController, UITableViewDataSource, UITableViewDelegate {
    static var shared = ViewControllerForTable()
    @IBOutlet var tableView: UITableView!
    var stringReceived : String = ""
    var root : [StoreItem]? = nil {
        didSet
        { DispatchQueue.main.async {
                self.tableView.reloadData()
                print("14 DidSet")
            }}}
    override func viewDidLoad() {
        print("4. textinput received \(stringReceived)")
        super.viewDidLoad()
        //all the attributes and methods of tableView usable by ViewController
        tableView.dataSource = self
        tableView.delegate = self
        print("5. loading Data")
        loadData()
    
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    func loadData() {
        print("6. entered loadData")
        ManageItemModel.shared.fetchData(term: stringReceived) {(result)
            in
            switch result {
            case .failure(let error):
                print(error)
            case .success (let decodedResult):
                self.root = decodedResult.hits
            }
        }
        self.tableView.reloadData()
    }
        
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let actualRoot = root {
            return actualRoot.count
        }else {
            return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")

        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        }
        if let actualRoot2 = root {
            cell?.textLabel?.text = actualRoot2[indexPath.row].item.itemName
            cell?.detailTextLabel?.text = actualRoot2[indexPath.row].item.brandName
            
        }
        return cell!
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "segue2", sender: self)
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue2",
            let destination = segue.destination as? SaveViewController,
            let rowIndex = tableView.indexPathForSelectedRow?.row
            {
            if let actualRoot3 = root{
                destination.itemName = actualRoot3[rowIndex].item.itemName!
                destination.brandName = actualRoot3[rowIndex].item.brandName!
            }
            
        }
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    3w
//    }
}
//    */


//@IBAction func searchButtonPressed(_ sender: UIButton) {
//    print("2. after search button pressed")
//    itemField.endEditing(true)
//    performSegue(withIdentifier: "segue1", sender: self)
//}
//override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//    if segue.identifier == "segue1",
//       let ViewControllerForTable = segue.destination as? ViewControllerForTable {
//        if itemField.text != nil {
//            textInput = itemField.text!
//            print("3. text saved and sent to ViewControllerForTable")
//            ViewControllerForTable.stringReceived = textInput
//        }
//    }
//}
