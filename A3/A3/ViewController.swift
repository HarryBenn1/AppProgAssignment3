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
        print(seatArray)

        if var fireView = gesture.view{
            //set tag odd or even
            //-ve for red
            
            if fireView.frame.equalTo(gesture.view!.frame){
                print("Tapped Seat")
                
                if(fireView.tag % 2 == 1){
                    fireView.tag = fireView.tag + 1
                    let image = UIImage(named: "GreenSeat")
                    let imageView = UIImageView(image: image)

                    imageView.tag = fireView.tag
                    let imageWidth: CGFloat = 20
                    let imageHeight: CGFloat = 20
                    
                    let rect = CGRect(x: 20, y: 699, width: imageWidth, height: imageHeight)
                    
                    
                    imageView.frame = rect
                    imageView.center = fireView.center
                    let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(gestureFired(_:)))
                    gestureRecognizer.numberOfTapsRequired = 1
                    gestureRecognizer.numberOfTouchesRequired = 1
                    
                    imageView.addGestureRecognizer(gestureRecognizer)
                    imageView.isUserInteractionEnabled = true
                    
                    fireView.removeFromSuperview()
                    seatArray.append(imageView)
                    self.view.addSubview(imageView)
                }
                else{
                    fireView.tag = fireView.tag + 1
                    let image = UIImage(named: "SeatIcon")
                    let imageView = UIImageView(image: image)

                    imageView.tag = fireView.tag
                    let imageWidth: CGFloat = 20
                    let imageHeight: CGFloat = 20
                    
                    let rect = CGRect(x: 20, y: 699, width: imageWidth, height: imageHeight)
                    
                    
                    imageView.frame = rect
                    imageView.center = fireView.center
                    let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(gestureFired(_:)))
                    gestureRecognizer.numberOfTapsRequired = 1
                    gestureRecognizer.numberOfTouchesRequired = 1
                    
                    imageView.addGestureRecognizer(gestureRecognizer)
                    imageView.isUserInteractionEnabled = true
                    
                    while seatArray.contains(fireView){
                        if let itemToRemoveIndex =  seatArray.index(of: fireView){
                            seatArray.remove(at: itemToRemoveIndex)
                        }
                    }
                    
                    
                    fireView.removeFromSuperview()
                    
                    self.view.addSubview(imageView)
                }
                

                }
            }
    }
    
    @objc func generateSeats(){
        for i in 1...5{
            for j in 1...5{
                let newImage = generateUIImageView()
                newImage.center = CGPoint(x: CGFloat(100 + 25 * i), y: CGFloat(200 + 70 * j ))
            }
        }
    }
    
    @objc func generateUIImageView() -> UIImageView {
            let tagNum = 1
            
            let image = UIImage(named: "SeatIcon")
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

}


