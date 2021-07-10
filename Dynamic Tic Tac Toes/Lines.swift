//
//  Lines.swift
//  Dynamic Tic Tac Toes
//
//  Created by Benjamin Ashamole on 5/3/21.
//

import UIKit
import Foundation

class ViewWithDiagonalLine: UIView {
    
    //private let gameView: UIView
    private let line1: UIView
    private let line2: UIView
    private let line3: UIView
    private let line4: UIView
    

    private var lengthConstraint1: NSLayoutConstraint!
    private var lengthConstraint2: NSLayoutConstraint!
    private var lengthConstraint3: NSLayoutConstraint!
    private var lengthConstraint4: NSLayoutConstraint!

    init() {
        // initialize gameview
        
        
        // Initialize line view
        line1 = UIView()
        line1.translatesAutoresizingMaskIntoConstraints = false
        line1.backgroundColor = UIColor.black
        
        line2 = UIView()
        line2.translatesAutoresizingMaskIntoConstraints = false
        line2.backgroundColor = UIColor.black
        
        line3 = UIView()
        line3.translatesAutoresizingMaskIntoConstraints = false
        line3.backgroundColor = UIColor.black
        
        line4 = UIView()
        line4.translatesAutoresizingMaskIntoConstraints = false
        line4.backgroundColor = UIColor.black

        //super.init(frame: CGRectZero)
        super.init(frame: CGRect())
        layer.zPosition = 0
        //clipsToBounds = true // Cut off everything outside the view
        

        // Add and layout the line view

        addSubview(line1)
        addSubview(line2)
        addSubview(line3)
        addSubview(line4)

        // Define line width
        line1.addConstraint(NSLayoutConstraint(item: line1, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 5))
        
        line2.addConstraint(NSLayoutConstraint(item: line2, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 5))
        
        line3.addConstraint(NSLayoutConstraint(item: line3, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 5))
        
        line4.addConstraint(NSLayoutConstraint(item: line4, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 5))
        

        // Set up line length constraint
        lengthConstraint1 = NSLayoutConstraint(item: line1, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 0)
        addConstraint(lengthConstraint1)
        
        lengthConstraint2 = NSLayoutConstraint(item: line2, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 0)
        addConstraint(lengthConstraint2)
        
        lengthConstraint3 = NSLayoutConstraint(item: line3, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 0)
        addConstraint(lengthConstraint3)
        
        lengthConstraint4 = NSLayoutConstraint(item: line4, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 0)
        addConstraint(lengthConstraint4)

         //Center line in view
        addConstraint(NSLayoutConstraint(item: line1, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: line1, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        
        addConstraint(NSLayoutConstraint(item: line2, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: line2, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        
        addConstraint(NSLayoutConstraint(item: line3, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: line3, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        
        addConstraint(NSLayoutConstraint(item: line4, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: line4, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        lengthConstraint1.constant = sqrt(pow(frame.size.width, 2) + pow(frame.size.height, 2))
        line1.transform = CGAffineTransform(rotationAngle: -atan2(frame.size.height, frame.size.width))
        
        lengthConstraint2.constant = sqrt(pow(frame.size.width, 2) + pow(frame.size.height, 2))
        line2.transform = CGAffineTransform(rotationAngle: atan2(frame.size.height, frame.size.width))
        
        lengthConstraint3.constant = sqrt(pow(frame.size.width, 2) + pow(frame.size.height, 2)) + 55
        line3.transform = CGAffineTransform(rotationAngle: atan2(frame.size.height-335, frame.size.width-335))
        line3.transform = CGAffineTransform(scaleX: CGFloat(0.5), y: CGFloat(1.0))
        
        lengthConstraint4.constant = sqrt(pow(frame.size.width, 2) + pow(frame.size.height, 2)) - 79
        line4.transform = CGAffineTransform(rotationAngle: atan2(frame.size.height, 0))
        
    }
    
    

}
