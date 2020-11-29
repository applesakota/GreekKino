//
//  CircleWhenIsSelected.swift
//  GreekKino
//
//  Created by Petar Sakotic on 11/29/20.
//  Copyright © 2020 Petar Sakotic. All rights reserved.
//

import Foundation
import UIKit

class CircleWhenIsSelected: UIView {
    override class var layerClass: AnyClass { return CAShapeLayer.self }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureUI()
    }
    
    func configureUI() {
        let layer = self.layer as! CAShapeLayer
        layer.strokeColor = UIColor.lightGray.cgColor
        layer.fillColor = nil
        let width: CGFloat = 3
        layer.lineWidth = width
        layer.path = CGPath(ellipseIn: bounds.insetBy(dx: width / 2, dy: width / 2), transform: nil)
    }
    
}
