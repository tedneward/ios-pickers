//
//  ViewController.swift
//  Pickers
//
//  Created by Ted Neward on 11/4/16.
//  Copyright © 2016 Ted Neward. All rights reserved.
//

import UIKit

class StringPickerModel : NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
  let data = [
    "UW", "WASU", "USC", "UCD", "UCLA", "OU", "OSU"
  ]
  
  private var selectedRow : Int = 0
  var selectedData : String {
    get { return data[selectedRow] }
  }

  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return data.count
  }
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return data[row]
  }
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    self.selectedRow = row
  }
}

class ViewController: UIViewController, UIPickerViewDelegate {

  @IBOutlet weak var datePicker: UIDatePicker!
  @IBAction func datePickerPicked(_ sender: UIDatePicker) {
    let date = datePicker.date.description
      // Note that the date will be in GMT, not local time
    let alert = UIAlertController(title: "DatePicker", message: "You chose \(date)", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    present(alert, animated: true, completion: nil)
  }

  @IBOutlet weak var stringPicker: UIPickerView!
  let stringPickerModel : StringPickerModel = StringPickerModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view, typically from a nib.
    stringPicker.delegate = stringPickerModel
    stringPicker.dataSource = stringPickerModel
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

