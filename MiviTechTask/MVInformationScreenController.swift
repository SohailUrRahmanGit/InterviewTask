//
//  MVUserInformationScreenController.swift
//  MiviTechTask
//
//  Created by SOHAIL UR RAHMAN on 12/05/18.
//  Copyright © 2018 SohailUrRahman. All rights reserved.
//

import UIKit

class MVInformationScreenController: UIViewController,UITableViewDelegate,UITableViewDataSource
{
    
    var userDetailsJson : NSDictionary = [:]
    var sectionsOfDataArray : NSArray = []
    var dataArray  : NSArray = []
    var attributesArray : NSArray = []
    @IBOutlet weak var userDetailTableView: UITableView!
    
    
 
    override func viewDidLoad()
    {
        super.viewDidLoad()
         print(userDetailsJson)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        dataArray = userDetailsJson["included"] as! NSArray;
        sectionsOfDataArray = dataArray.value(forKey: "type") as! NSArray
        return (sectionsOfDataArray as AnyObject).count
    }
    

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 50))
        view.backgroundColor = UIColor(red: 41.0/255.0, green: 144.0/255.0, blue: 199.0/255.0, alpha: 1.0)
        let label = UILabel(frame: CGRect(x: 15, y: 0, width: tableView.bounds.width - 30, height: 50))
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = UIColor.white

            switch section {
            case 0:
                label.text =  sectionsOfDataArray.object(at: section) as? String
            case 1:
                label.text = sectionsOfDataArray.object(at: section) as? String
            case 2:
                label.text = sectionsOfDataArray.object(at: section) as? String
            default:
                label.text = ""
            }
        
        view.addSubview(label)
        return view

    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        attributesArray = dataArray.value(forKey: "attributes") as! NSArray
        return (attributesArray.object(at: section) as AnyObject).count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = userDetailTableView.dequeueReusableCell(withIdentifier: kCellID) as UITableViewCell!
        
        
        let parsingAttributes : NSDictionary = attributesArray.object(at: indexPath.section) as! NSDictionary
        let attributesAllkeys : NSArray = parsingAttributes.allKeys as NSArray
        let attributesAllvalues : NSArray = parsingAttributes.allValues as NSArray

        let keyforEachRow : String = (attributesAllkeys.object(at: indexPath.row) as! String)
        let valueForEachRow : Any = attributesAllvalues.object(at: indexPath.row)

        cell.textLabel?.text = keyforEachRow
        cell.detailTextLabel?.text =  String(describing: valueForEachRow)
        
        return cell
        
    }


}
