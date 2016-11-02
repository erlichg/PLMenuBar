//
//  PLMenuDetailDescView.swift
//  PLMenuBar
//
//  Created by Patrick Lin on 4/13/16.
//  Copyright © 2016 Patrick Lin. All rights reserved.
//
import UIKit

open class PLMenuDetailDescView: PLMenuDetailView {
    
    var text: String = "";
    
    // MARK: Public Methods
    
    override open func layoutSubviews() {
        
        super.layoutSubviews();
     
        self.contentViews[0].frame = self.bounds;
        
    }
    
    // MARK: Init Methods
    
    func commonInit() {
        
        let content: UILabel = UILabel();
        
        content.numberOfLines = 0;
        
        content.font = UIFont.systemFont(ofSize: 20);
        
        content.textAlignment = NSTextAlignment.justified;
        
        content.text = self.text;
        
        self.addSubview(content);
        
        self.contentViews.append(content);
        
    }
    
    convenience init(text: String) {
        
        self.init(frame: CGRect.zero);
        
        self.text.append(text);
        
        self.commonInit();
        
    }

}
