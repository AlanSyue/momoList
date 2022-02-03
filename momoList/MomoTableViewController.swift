//
//  MomoTableViewController.swift
//  momoList
//
//  Created by 林翊婷 on 2022/2/2.
//

import UIKit

class MomoTableViewController: UITableViewController {
    enum Section {
        case all
    }
    

    @IBOutlet weak var segmentLabel: UISegmentedControl!
    //    var shopping:[ShoppingItem] = [
//        ShoppingItem(name: "IPHONE特惠組", price: 10000, image: "iphonePic"),
//        ShoppingItem(name: "SK-II保養品", price: 8000, image: "sk2Pic"),
//        ShoppingItem(name: "香奈兒時尚包", price: 250000, image: "chanelPic"),
//        ShoppingItem(name: "BRUNO鍋具", price: 3000, image: "brunoPic")
//    ]
    enum Category: String {
        case productOf3C = "3C用品"
        case GirlsItem = "女孩兒最愛"
        case kitchenItem = "廚具"
    }
    
    var name = ["IPHONE特惠組","SK-II保養品","香奈兒時尚包","BRUNO鍋具"]
    var image = ["iphonePic","sk2Pic","chanelPic","brunoPic"]
    var price = [10000,8000,250000,3000]
    var category = [Category.productOf3C,Category.GirlsItem,Category.GirlsItem,Category.kitchenItem]
    
   
    
// ------------------------------------------------------------------------------
    @IBAction func segmentControl(_ sender: UISegmentedControl) {
        let categoryItem = sender.titleForSegment(at: sender.selectedSegmentIndex)!
        if categoryItem == Category.productOf3C.rawValue {
            print("這個分類是：3C用品")
        } else if categoryItem == Category.GirlsItem.rawValue {
            print("這個分類是：女孩兒最愛")
        } else{
            print("這個分類是：廚具")
        }
        
    }
    
// ------------------------------------------------------------------------------


    func configureDataSource() -> UITableViewDiffableDataSource<Section, String> {
        let cellIdentifier = "MyCell"
        let dataSource = UITableViewDiffableDataSource<Section, String>( tableView: tableView,
            cellProvider: { tableView, indexPath, restaurantName in
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MomoTableViewCell
            cell.nameLabel?.text = self.name[indexPath.row]
            cell.thumbnailImageView?.image = UIImage(named: self.image[indexPath.row])
            cell.priceLabel?.text = String("NT\(self.price[indexPath.row])")
            cell.categoryLabel?.text = String("\(self.category[indexPath.row].rawValue)")
            
            //let catchCategory =
            return cell
        }
        )
        return dataSource
    }
        
    lazy var dataSource = configureDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = dataSource
        var snapshot = NSDiffableDataSourceSnapshot<Section, String>()
            snapshot.appendSections([.all])
            snapshot.appendItems(name, toSection: .all)
        dataSource.apply(snapshot, animatingDifferences: false)
    }

    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    // MARK: - 使用Segue傳遞資料
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! MomoDetailViewController
                destinationController.detailImageItem = self.image[indexPath.row]
                destinationController.detailNameItem = self.name[indexPath.row]
                destinationController.detailPriceItem = "促銷優惠價：\(self.price[indexPath.row])"
            }
        }
    }
    

}

//override func tableView(_ tableView: UITableView, categoryForRowAt indexPath: IndexPath) -> Category {
//    return self.category[indexPath.row].rawValue
//    
//}
