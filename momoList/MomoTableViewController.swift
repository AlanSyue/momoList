import UIKit

class MomoTableViewController: UITableViewController {
    enum Section {
        case all
    }
    

    @IBOutlet weak var segmentLabel: UISegmentedControl!

    enum Category: String {
        case productOf3C = "3C用品"
        case GirlsItem = "女孩兒最愛"
        case kitchenItem = "廚具"
    }
    
    var name = ["IPHONE特惠組","SK-II保養品","香奈兒時尚包","BRUNO鍋具"]
    var filterName: [String] = []
    var image = ["iphonePic","sk2Pic","chanelPic","brunoPic"]
    var filterImage: [String] = []
    var price = [10000,8000,250000,3000]
    var filterPrice: [Int] = []
    var category = [Category.productOf3C,Category.GirlsItem,Category.GirlsItem,Category.kitchenItem]
    var filterCategory: [Category] = []
    
    
    func resetFilterArray() {
            self.filterName = []
            self.filterPrice = []
            self.filterImage = []
            self.filterCategory = []
        }
    

    func configureDataSource() -> UITableViewDiffableDataSource<Section, String> {
        let categoryTitle = self.segmentLabel.titleForSegment(at: self.segmentLabel.selectedSegmentIndex)!
        resetFilterArray()
        for (index, productCategory) in category.enumerated() {
            if productCategory.rawValue != categoryTitle {
                continue
            }
            self.filterName.append(self.name[index])
            self.filterPrice.append(self.price[index])
            self.filterImage.append(self.image[index])
            self.filterCategory.append(productCategory)
        }
        
        let cellIdentifier = "MyCell"
        let dataSource = UITableViewDiffableDataSource<Section, String>( tableView: tableView,
            cellProvider: { tableView, indexPath, ItemsName  in
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MomoTableViewCell
            cell.nameLabel?.text = self.filterName[indexPath.row]
            cell.thumbnailImageView?.image = UIImage(named: self.filterImage[indexPath.row])
            cell.priceLabel?.text = String("NT\(self.filterPrice[indexPath.row])")
            cell.categoryLabel?.text = String("\(self.filterCategory[indexPath.row].rawValue)")
//            cell.nameLabel?.text = self.name[indexPath.row]
//            cell.thumbnailImageView?.image = UIImage(named: self.image[indexPath.row])
//            cell.priceLabel?.text = String("NT\(self.price[indexPath.row])")
//            cell.categoryLabel?.text = String("\(self.category[indexPath.row].rawValue)")
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
        return self.filterName.count
    }

    // MARK: - 使用Segue傳遞資料
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! MomoDetailViewController
                destinationController.detailImageItem = self.filterImage[indexPath.row]
                destinationController.detailNameItem = self.filterName[indexPath.row]
                destinationController.detailPriceItem = "促銷優惠價：\(self.filterPrice[indexPath.row])"
//                destinationController.detailImageItem = self.image[indexPath.row]
//                destinationController.detailNameItem = self.name[indexPath.row]
//                destinationController.detailPriceItem = "促銷優惠價：\(self.price[indexPath.row])"
            }
        }
    }
    

}


// ------------------------------------------------------------------------------
//    @IBAction func segmentControl(_ sender: UISegmentedControl) {
//        configureDataSource()
    //self.tableView.reloadData()
//        let categoryItem = sender.titleForSegment(at: sender.selectedSegmentIndex)!
//
//        var categoryName:[String] = []
//        var categoryImage:[String] = []
//        var categoryPrice:[Int] = []
//
//        for (index,findCategory) in category.enumerated() {
//            if findCategory.rawValue != categoryItem {
//                continue
//            }
//            //print(self.name[index])
//            categoryName.append(self.name[index])
//            categoryImage.append(self.image[index])
//            categoryPrice.append(self.price[index])
//
//        }
    
//        if categoryItem == Category.productOf3C.rawValue {
//            print("這個分類是：3C用品")
//        } else if categoryItem == Category.GirlsItem.rawValue {
//            print("這個分類是：女孩兒最愛")
//        } else{
//            print("這個分類是：廚具")
//        }
//    }
//    b
// ------------------------------------------------------------------------------

//    var shopping:[ShoppingItem] = [
//        ShoppingItem(name: "IPHONE特惠組", price: 10000, image: "iphonePic"),
//        ShoppingItem(name: "SK-II保養品", price: 8000, image: "sk2Pic"),
//        ShoppingItem(name: "香奈兒時尚包", price: 250000, image: "chanelPic"),
//        ShoppingItem(name: "BRUNO鍋具", price: 3000, image: "brunoPic")
//    ]
