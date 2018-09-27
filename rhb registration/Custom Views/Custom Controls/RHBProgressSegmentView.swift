//
//  RHBProgressSegmentView.swift
//  rhb registration
//
//  Created by Ghean Ginanjar on 27/09/18.
//  Copyright © 2018 RHB TradeSmart. All rights reserved.
//

import UIKit

@IBDesignable
class RHBProgressSegmentView: UIView {
  
  //had to have a backup value to provide value for getter
  fileprivate var _numberOfMilestone: Int = 1
  @IBInspectable var numberOfMilestone: Int {
    set(newValue) {
      if newValue == 0 {
        _numberOfMilestone = 1
      }
      _numberOfMilestone = newValue
      layoutSubviews()
    }
    get {
      return _numberOfMilestone
    }
  }
  
  @IBInspectable var activeMilestoneIndex: Int = 1 {
    didSet(value) {
      if value <= numberOfMilestone && value > 0 {
        layoutSubviews()
      }
    }
  }
  
  fileprivate var milestoneCenterPoints: [CGPoint] = []

  fileprivate let lineMargin: CGFloat = 7.0
  fileprivate let lineLayer = CALayer()
  fileprivate let progressLayer = CALayer()
  fileprivate let milestoneLayer = CALayer()
  
  override func draw(_ rect: CGRect) {
      // Drawing code
    generateCenterPoints(withContainerRect: rect)
    drawLineBetweenPoints(inRect: rect)
    drawProgressArea(inRect: rect)
    drawMilestoneLayer(inRect: rect)
  }
  
  fileprivate func generateCenterPoints(withContainerRect rect: CGRect) {
    let milestoneAreaSize = CGSize(width: (rect.size.width/CGFloat(self.numberOfMilestone)), height: rect.size.height)
    var areaOrigin = CGPoint.zero
    let areaCenterY = milestoneAreaSize.height / 2.0
    for i in 0 ..< numberOfMilestone {
      let calculateNewX = (milestoneAreaSize.width * CGFloat(i))
      areaOrigin = CGPoint(x: calculateNewX, y: areaOrigin.y)
      let areaCenterX = calculateNewX + (milestoneAreaSize.width/2.0)
      let areaCenterPoint = CGPoint(x: areaCenterX, y: areaCenterY)
      milestoneCenterPoints.append(areaCenterPoint)
    }
  }
  
  fileprivate func drawLineBetweenPoints(inRect rect: CGRect) {
    lineLayer.removeFromSuperlayer()
    lineLayer.frame = rect
    for startingIndex in 1 ..< numberOfMilestone {
      let startPoint = milestoneCenterPoints[startingIndex - 1].x + lineMargin
      let endPoint = milestoneCenterPoints[startingIndex].x - lineMargin
      let width = endPoint - startPoint
      let size = CGSize(width: width, height: 1.5)
      let origin = CGPoint(x: startPoint, y: frame.size.height/2.0)
      
      let lineLayerSub = CALayer()
      let subRect = CGRect(origin: origin, size: size)
      lineLayerSub.frame = subRect
      lineLayerSub.backgroundColor = UIColor.lightGray.cgColor
      lineLayer.addSublayer(lineLayerSub)
    }
    layer.addSublayer(lineLayer)
  }
  
  fileprivate func drawProgressArea(inRect rect: CGRect) {
    progressLayer.removeFromSuperlayer()
    progressLayer.frame = rect
    let circleLayer = CAShapeLayer()
    let radius: CGFloat = rect.size.height / 3.0
    let drawPoint = milestoneCenterPoints[activeMilestoneIndex]
    circleLayer.path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 2.0 * radius, height: 2.0 * radius), cornerRadius: radius).cgPath
    circleLayer.position = CGPoint(x: drawPoint.x - radius, y: drawPoint.y - radius)
    circleLayer.fillColor = UIColor.orange.cgColor
    progressLayer.addSublayer(circleLayer)
    layer.addSublayer(progressLayer)
  }
  
  fileprivate func drawMilestoneLayer(inRect rect: CGRect) {
    milestoneLayer.removeFromSuperlayer()
    milestoneLayer.frame = rect
    for drawPoint in milestoneCenterPoints {
      let circleLayer = CAShapeLayer()
      let radius: CGFloat = 3.0
      circleLayer.path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 2.0 * radius, height: 2.0 * radius), cornerRadius: radius).cgPath
      circleLayer.position = CGPoint(x: drawPoint.x - radius, y: drawPoint.y - radius)
      circleLayer.fillColor = UIColor.black.cgColor
      milestoneLayer.addSublayer(circleLayer)
    }
    layer.addSublayer(milestoneLayer)
  }
}
