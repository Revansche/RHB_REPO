//
//  MLOLabel.swift
//  "Multiple Link On Label" Class
//
//  Created by Ghean Ginanjar on 12/9/16.

import UIKit


class MLOText {
  let word: String
  let color: UIColor
  let font: UIFont
  
  init(word: String, color: UIColor, font: UIFont) {
    self.word = word
    self.color = color
    self.font = font
  }
}

class MLOLink: MLOText {
  let link: String
  
  init(word: String, color: UIColor, font: UIFont, link: String) {
    self.link = link
    super.init(word: word, color: color, font: font)
  }
}

protocol MLOLabelDataSource: class {
  func linksToShowOnLabel() -> [MLOLink]
  func textToShowOnLabel() -> MLOText
}

class MLOData: MLOLabelDataSource {
  
  fileprivate var links: [MLOLink] = []
  fileprivate let text: MLOText
  
  init(withMLOText text: MLOText) {
    self.text = text
  }
  
  func appendLink(link: MLOLink) {
    links.append(link)
  }
  
  internal func linksToShowOnLabel() -> [MLOLink] {
    return links
  }
  
  internal func textToShowOnLabel() -> MLOText {
    return text
  }
}

class MLOLabel: UILabel {
  
  var dataSource: MLOLabelDataSource?
  fileprivate var existingLinkOnRange: [[String: Any]] = []

  //MARK: Setups
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    addTapGestureToSelf()
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    addTapGestureToSelf()
  }
  
  func addTapGestureToSelf(){
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapped))
    self.isUserInteractionEnabled = true
    self.addGestureRecognizer(tapGesture)
  }
  
  @objc func tapped(_ tapGesture : UITapGestureRecognizer){
    searchTapCoordinateOnRange(tapGesture)
  }
  
  //MARK: Processing text
  override func draw(_ rect: CGRect) {
    
    if let dataSource = dataSource {
      let mloText = dataSource.textToShowOnLabel()
      let links = dataSource.linksToShowOnLabel()
      let preparedMutableString = NSMutableAttributedString(string: mloText.word)
      preparedMutableString.beginEditing()
      preparedMutableString.addAttribute(.font, value: mloText.font, range: NSMakeRange(0, preparedMutableString.length))
      preparedMutableString.addAttribute(.foregroundColor, value: mloText.color, range: NSMakeRange(0, preparedMutableString.length))
      for link in links {
        processLinkToMutableAttributedString(link: link, mutableAttributedString: preparedMutableString)
      }
      preparedMutableString.endEditing()
      self.attributedText = preparedMutableString
    }
    
    super.draw(rect)
  }
  
  func processLinkToMutableAttributedString(link: MLOLink, mutableAttributedString: NSMutableAttributedString) {
    let linkRangeInString: NSRange = mutableAttributedString.mutableString.range(of: link.word)
    mutableAttributedString.addAttribute(.font, value: link.font, range: linkRangeInString)
    mutableAttributedString.addAttribute(.foregroundColor, value: link.color, range: linkRangeInString)
    existingLinkOnRange.append(["link": link.link, "range": linkRangeInString])
  }
  
  //MARK: Tap Logic
  func searchTapCoordinateOnRange(_ tapGesture : UITapGestureRecognizer){
    guard let attributedText = self.attributedText else {
      print("there is no attributedText being set")
      return
    }
    let labelSize = self.bounds.size;
    // create instances of NSLayoutManager, NSTextContainer and NSTextStorage
    let layoutManager = NSLayoutManager()
    let textContainer = NSTextContainer(size: CGSize.zero)
    let textStorage = NSTextStorage(attributedString: attributedText)
    
    // configure layoutManager and textStoragez
    layoutManager.addTextContainer(textContainer)
    textStorage.addLayoutManager(layoutManager)
    
    // configure textContainer for the label
    textContainer.lineFragmentPadding = 0.0;
    textContainer.lineBreakMode = self.lineBreakMode;
    textContainer.maximumNumberOfLines = self.numberOfLines;
    textContainer.size = labelSize;
    
    // find the tapped character location and compare it to the specified range
    let locationOfTouchInLabel = tapGesture.location(in: self)
    // layoutManager.usedRectForTextContainer(textContainer)
    let textBoundingBox = CGRect(origin: CGPoint.zero, size: labelSize)
    let textContainerOffset = CGPoint(x: (labelSize.width - textBoundingBox.size.width) * 0.5 - textBoundingBox.origin.x,
                                      y: (labelSize.height - textBoundingBox.size.height) * 0.5 - textBoundingBox.origin.y);
    let locationOfTouchInTextContainer = CGPoint(x: locationOfTouchInLabel.x - textContainerOffset.x,
                                                 y: locationOfTouchInLabel.y - textContainerOffset.y);
    let indexOfCharacter = layoutManager.characterIndex(for: locationOfTouchInTextContainer, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
    for item in existingLinkOnRange {
      let foundRange = item["range"] as! [NSRange]
      let isInRange = foundRange.map{NSLocationInRange(indexOfCharacter, $0)}.contains(true)
      if isInRange {
        print("Do something like showing the link on safari")
        guard let url = URL(string: item["link"] as! String) else {
          print("URL cannot be parsed as URL, check if the fornat is valid")
          return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
        return
      } else {
        print("Do nothing")
        continue
      }
    }
  }
}
