//
//  PLMenuDetailComboRowView.swift
//  PLMenuBar
//
//  Created by Patrick Lin on 4/14/16.
//  Copyright © 2016 Patrick Lin. All rights reserved.
//
import UIKit

open class PLMenuDetailComboRowView: UIView {
    
    var title: String = "";
    
    open var isSelected: Bool = false {
        didSet
        {
            if self.isSelected != oldValue {
                
                self.updateStyle();
                
            }
        }
    }
    
    var isHighLighted: Bool = false {
        didSet
        {
            self.updateStyle();
        }
    }
    
    var checkBoxView: UIImageView = UIImageView();
    
    var contentBtn: UIButton = UIButton();
    
    // MARK: Public Methods
    
    override open func layoutSubviews() {
        
        super.layoutSubviews();
        
        self.checkBoxView.frame = CGRect(x: 8, y: 0, width: 22, height: self.bounds.size.height);
        
        self.contentBtn.frame = CGRect(x: 30, y: 0, width: self.bounds.size.width - 30, height: self.bounds.size.height);
        
    }
    
    // MRK: Private Methods
    
    func updateStyle() {
        
        self.checkBoxView.isHidden = !self.isSelected;
        
        var color = UIColor.white //(self.isHighLighted == true) ? UIColor.white : UIColor.darkGray;
        
        //if #available(tvOS 10.0, *), self.traitCollection.userInterfaceStyle == UIUserInterfaceStyle.dark {
        //    color = (self.isHighLighted == true) ? UIColor.white : UIColor.black;
        //}
        
        self.checkBoxView.tintColor = color;
        
        self.contentBtn.setTitleColor(color, for: UIControlState());
        
        if self.isHighLighted {
            self.contentBtn.titleLabel?.font = self.contentBtn.titleLabel?.font.withSize(25)
        } else {
            self.contentBtn.titleLabel?.font = self.contentBtn.titleLabel?.font.withSize(20)
        }
        
    }
    
    
    
    
    
    // MARK: Init Methods
    
    func commonInit() {
        
        self.contentBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left;
        
        self.contentBtn.setTitle(title, for: UIControlState());
        
        if self.contentBtn.titleLabel != nil {
            
            self.contentBtn.titleLabel!.font = UIFont.boldSystemFont(ofSize: 28);
            
            self.contentBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0);
            
        }
        
        self.addSubview(self.contentBtn);
        
        let bundle = Bundle(for: PLMenuDetailComboRowView.self);
        
        var image = UIImage(named: "button-check.png", in: bundle, compatibleWith: nil);
        
        image = image?.withRenderingMode(UIImageRenderingMode.alwaysTemplate);
        
        if image != nil {
            
            self.checkBoxView.image = image!;
            
            self.checkBoxView.contentMode = UIViewContentMode.scaleAspectFit;
            
        }
        
        self.addSubview(self.checkBoxView);
        
        self.updateStyle();
        
    }
    
    convenience init(title: String) {
        
        self.init(frame: CGRect.zero);
        
        self.title.append(title);
        
        self.commonInit();
        
    }

}
