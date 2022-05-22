//
//  ViewController.swift
//  A3
//
//  Created by Harrison Benn on 20/5/2022.
//

import UIKit

class ViewController: UIViewController {
    

    
    var lastTapped = 0
    var seatTag = 1
    
    var seatArray = [UIView]()

    override func viewDidLoad() {
        
        generateSeats()
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    @objc func gestureFired(_ gesture: UITapGestureRecognizer){
        if var fireView = gesture.view{
            //set tag odd or even
            //-ve for red
            
            if fireView.frame.equalTo(gesture.view!.frame){
              
                if(fireView.tag % 2 == 1 && fireView.tag > 0){
                    fireView.tag = fireView.tag + 1
                    let newImage = generateUIImageView("GreenSeat", fireView.tag)
                    newImage.center = fireView.center
                    
                    fireView.removeFromSuperview()
                    seatArray.append(newImage)
                    
                }
                else if(fireView.tag %  2 == 0 && fireView.tag > 0){
                    fireView.tag = fireView.tag + 1
                    let newImage = generateUIImageView("SeatIcon", fireView.tag)
                    newImage.center = fireView.center
                    
                    fireView.removeFromSuperview()
                    
                    
                    while seatArray.contains(fireView){
                        if let itemToRemoveIndex =  seatArray.index(of: fireView){
                            seatArray.remove(at: itemToRemoveIndex)
                        }
                    }
                    
                }
                

                }
            }
    }
    
    @IBAction func ConfirmSeats(_ sender: Any) {
        if seatArray.count > 0{
            for image in seatArray{
                let newImage = generateUIImageView("RedSeat", -1)
                newImage.center = image.center
                
            }
            
            seatArray.removeAll()
        }
        
        
    }
    
    
    @objc func generateSeats(){
        for i in 1...7{
            for j in 1...7{
                let newImage = generateUIImageView("SeatIcon", 1)
                newImage.center = CGPoint(x: CGFloat(100 + 25 * i), y: CGFloat(100 + 70 * j ))
            }
        }
    }
    
    @objc func generateUIImageView(_ colour: String, _ tag: Int) -> UIImageView {
            let tagNum = tag
            
        let image = UIImage(named: colour)
            let imageView = UIImageView(image: image)
            let viewWidth: CGFloat = UIScreen.main.bounds.width - 40
            //let viewHeight: CGFloat = UIScreen.main.bounds.height - 400
            imageView.tag = tagNum
            let imageWidth: CGFloat = 20
            let imageHeight: CGFloat = 20
            
            let rect = CGRect(x: 20, y: 699, width: imageWidth, height: imageHeight)
            
            
            imageView.frame = rect
            imageView.center = CGPoint(x: CGFloat(0), y: CGFloat(0))
            
            let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(gestureFired(_:)))
            gestureRecognizer.numberOfTapsRequired = 1
            gestureRecognizer.numberOfTouchesRequired = 1
            
            imageView.addGestureRecognizer(gestureRecognizer)
            imageView.isUserInteractionEnabled = true
            
            
            self.view.addSubview(imageView)
            
            
            
            return imageView
        }
    @IBAction func CancelSeats(_ sender: Any) {
        if seatArray.count > 0 {
            for image in seatArray{
                image.self.removeFromSuperview()
                let newImage = generateUIImageView("SeatIcon", 1)
                newImage.center = image.center
                
            }
            
            seatArray.removeAll()
        }
    }
    
}


