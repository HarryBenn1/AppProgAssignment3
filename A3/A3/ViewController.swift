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
    
    func makeSeat(_ colour: String) -> UIImageView{
        let image = UIImage(named: colour)
        let imageView = UIImageView(image: image)
        let viewWidth: CGFloat = UIScreen.main.bounds.width - 40
        //let viewHeight: CGFloat = UIScreen.main.bounds.height - 400
        if (colour == "RedSeat"){
            imageView.tag = -1
        }
        else if(colour == "GreenSeat"){
            imageView.tag = 2
        }
        else{
            imageView.tag = 1
        }
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
    @objc func gestureFired(_ gesture: UITapGestureRecognizer){
        print(seatArray)

        if var fireView = gesture.view{
            //set tag odd or even
            //-ve for red
            
            if fireView.frame.equalTo(gesture.view!.frame){
                print("Tapped Seat")
                
                if fireView.tag == -1 {
                    let newSeat = makeSeat("RedSeat")
                    
                }
                
                else if(fireView.tag % 2 == 1 && fireView.tag > 0){
                    fireView.tag = fireView.tag + 1
                    let image = makeSeat("GreenSeat")
                    seatArray.append(image)
                    
                    fireView.removeFromSuperview()
                    self.view.addSubview(image)
                    
                }
                else{
                    fireView.tag = fireView.tag + 1
                    let image = makeSeat("SeatIcon")
                    
                    fireView.removeFromSuperview()
                    self.view.addSubview(image)
                }
                

                }
            }
    }
    
    func removeSeatArray(_ fireView: UIImageView){
        while seatArray.contains(fireView){
            if let itemToRemoveIndex =  seatArray.index(of: fireView){
                seatArray.remove(at: itemToRemoveIndex)
            }
        }
    }
    
    @objc func generateSeats(){
        for i in 1...6{
            for j in 1...6{
                let newImage = makeSeat("SeatIcon")
                newImage.center = CGPoint(x: CGFloat(100 + 25 * i), y: CGFloat(200 + 70 * j ))
            }
        }
    }
    
    

}


