//
//  ViewController.swift
//  multipy calculator
//
//  Created by Laviolette, Akivah - Student on 9/7/22.
//

// could use similar code to the ticket counter

extension UIColor
{
    var isDarkColor: Bool {
        var r, g, b, a: CGFloat
        (r, g, b, a) = (0, 0, 0, 0)
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        let lum = 0.2126 * r + 0.7152 * g + 0.0722 * b
        return  lum < 0.50
    }
}
//makes it so the code detects the color values of the background and changes the text color depending on how light or dark it is.

import UIKit

class ViewController: UIViewController {
    
var numberOnScreen: Double = 0;

var previousNumber: Double = 0;

var performingMath = false;

var operation = 0;

@IBAction func numbers(_ sender: UIButton) {

if performingMath == true {

label.text = String(sender.tag-1)

numberOnScreen = Double(label.text!)!

performingMath = false

}
else {

label.text = label.text! + String(sender.tag-1)

numberOnScreen = Double(label.text!)!

}

}

    @IBOutlet weak var label: UILabel!
    
@IBAction func buttons(_ sender: UIButton) {

if label.text != "" && sender.tag != 11 && sender.tag != 16{

    previousNumber = Double(label.text!) ?? 0.0 // gives a default value to prevent a crash

if sender.tag == 12 { //Divide

label.text = "/";

}

if sender.tag == 13 { //Multiply

label.text = "x";

}

if sender.tag == 14 { //Subtract

label.text = "-";

}

if sender.tag == 15 { //Add

label.text = "+";

}

operation = sender.tag

performingMath = true;

}

else if sender.tag == 16 {

if operation == 12{ //Divide

label.text = String(previousNumber / numberOnScreen)

}

else if operation == 13{ //Multiply

label.text = String(previousNumber * numberOnScreen)

}

else if operation == 14{ //Subtract

label.text = String(previousNumber - numberOnScreen)

}

else if operation == 15{ //Add

label.text = String(previousNumber + numberOnScreen)

}

}

else if sender.tag == 11{

label.text = ""

previousNumber = 0;

numberOnScreen = 0;

operation = 0;

}

}

override func viewDidLoad() {
    
    
    super.viewDidLoad()
        
   
    label.textColor = view.backgroundColor?.isDarkColor == true ? .white : .black //other code at very top. makes it so the code detects the color values of the background and changes the text color depending on how light or dark it is.
}

override func didReceiveMemoryWarning() {

super.didReceiveMemoryWarning()



}

}
