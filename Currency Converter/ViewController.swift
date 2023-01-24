//
//  ViewController.swift
//  Currency Converter
//
//  Created by shoeb on 24/01/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lebelCAD: UILabel!
    @IBOutlet weak var lebelCHF: UILabel!
    @IBOutlet weak var lebelGBP: UILabel!
    @IBOutlet weak var lebelJPY: UILabel!
    @IBOutlet weak var lebelUSD: UILabel!
    @IBOutlet weak var lebelTRY: UILabel!
    @IBOutlet weak var lebelINR: UILabel!
    @IBOutlet weak var lebelPKR: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func getRateBTN(_ sender: Any) {
        
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=4a990ae1cc0ef5a920e4c7e9eeb1123c")
        let session = URLSession.shared
        let task = session.dataTask(with: url!) { (data, response, error) in
            if error != nil{
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okBTN = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okBTN)
                self.present(alert, animated: true, completion: nil)
            }else{
                if data != nil{
                    do{
                        let jsonresponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)
                        as! Dictionary<String, Any>
                        DispatchQueue.main.async {
                            if let rates = jsonresponse["rates"] as? [String : Any]{
                                if let cad = rates["CAD"] as? Double {
                                    self.lebelCAD.text = "CAD : \(cad)"
                                }
                                if let chf = rates["CHF"] as? Double {
                                    self.lebelCHF.text = "CHF : \(chf)"
                                }
                                if let gbp = rates["GBP"] as? Double {
                                    self.lebelGBP.text = "GBP : \(gbp)"
                                }
                                if let jpy = rates["JPY"] as? Double {
                                    self.lebelJPY.text = "JPY : \(jpy)"
                                }
                                if let usd = rates["USD"] as? Double {
                                    self.lebelUSD.text = "USD : \(usd)"
                                }
                                if let turkish = rates["TRY"] as? Double {
                                    self.lebelTRY.text = "TRY : \(turkish)"
                                }
                                if let india = rates["INR"] as? Double {
                                    self.lebelINR.text = "INR : \(india)"
                                }
                                if let pakistan = rates["PKR"] as? Double {
                                    self.lebelPKR.text = "PKR : \(pakistan)"
                                }
                            }
                        }
                    }
                    catch{
                        print("Error")
                    }
                }
            }
        }
        task.resume()
    }
}

