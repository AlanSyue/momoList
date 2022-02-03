import UIKit

class MomoDetailViewController: UIViewController {
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailName: UILabel!
    @IBOutlet weak var deatailPrice: UILabel!
    
    
    var detailImageItem = ""
    var detailNameItem = ""
    var detailPriceItem = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailImage.image = UIImage(named: detailImageItem)
        detailName.text = detailNameItem
        deatailPrice.text = detailPriceItem
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
