//
//  ThirdViewController.swift
//  Learning-FaboSwiftDocs4
//
//  Created by 小室沙央里 on 2022/08/26.
//

import UIKit

class ThirdViewController: UIViewController {
    
    private let myInputImage = CIImage(image: UIImage(named: "IMG_7572.jpeg")!)
    
    private var myImageView: UIImageView!
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        self.view.backgroundColor = UIColor.green
        
        self.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 3)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    required override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: Bundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        myImageView = UIImageView(frame: self.view.frame)
        myImageView.image = UIImage(ciImage: myInputImage!)
        
        self.view.addSubview(myImageView)
        
        // Sliderを作成
        let myGreenSlider = UISlider(frame: CGRect(x: 0,y: 0, width: 200, height: 30))
        myGreenSlider.layer.position = CGPoint(x: self.view.frame.midX, y: 500)
        myGreenSlider.backgroundColor = UIColor.white
        myGreenSlider.layer.cornerRadius = 10.0
        myGreenSlider.layer.shadowOpacity = 0.5
        myGreenSlider.layer.masksToBounds = false

        
        myGreenSlider.minimumValue = 0
        myGreenSlider.maximumValue = 1
        
        myGreenSlider.value = 0.5
        
        myGreenSlider.maximumTrackTintColor = UIColor.gray
        myGreenSlider.minimumTrackTintColor = UIColor.black
        
        myGreenSlider.addTarget(self, action: #selector(ThirdViewController.onChangeValueMySlider(sender:)), for: UIControl.Event.valueChanged)
        
        self.view.addSubview(myGreenSlider)
        
        self.view.backgroundColor = UIColor(red: 0, green: CGFloat(myGreenSlider.value), blue: 0, alpha: 1)
        
    }
    
    @objc internal func onChangeValueMySlider(sender: UISlider) {
        
        
        self.view.backgroundColor = UIColor(red: 0, green: CGFloat(sender.value), blue: 0, alpha: 1)
        let myColorFilter = CIFilter(name: "CIColorCrossPolynomial")
        myColorFilter!.setValue(myInputImage, forKey: kCIInputImageKey)
        
        let r: [CGFloat] = [0.0, CGFloat(sender.value), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
        let g: [CGFloat] = [0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
        let b: [CGFloat] = [1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
        
        myColorFilter!.setValue(CIVector(values: r, count: 10), forKey: "inputRedCoefficients")
        myColorFilter!.setValue(CIVector(values: g, count: 10), forKey: "inputGreenCoefficients")
        myColorFilter!.setValue(CIVector(values: b, count: 10), forKey: "inputBlueCoefficients")
        
        let myOutputImage: CIImage = myColorFilter!.outputImage!
        
        myImageView.image = UIImage(ciImage: myOutputImage)
        
        myImageView.setNeedsDisplay()
        
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
