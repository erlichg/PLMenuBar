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
    var title: String = "";
    var image: String = "";
    
    // MARK: Public Methods
    
    override open func layoutSubviews() {
        
        super.layoutSubviews();
     
        var width:CGFloat = 0
        if self.contentViews.count == 3 {
            let img:UIImage = (self.contentViews[2] as! UIImageView).image!
            let height = min(img.size.height, self.bounds.height - 20)
            let multiplier = img.size.height / height
            width = img.size.width / multiplier
            self.contentViews[2].frame = CGRect(x:self.bounds.minX, y:self.bounds.minY + 10, width:width, height:height) //image
        }
        self.contentViews[0].frame = CGRect(x:self.bounds.minX + width + 20, y:self.bounds.minY, width:self.bounds.width - width - 20, height:100) //title
        self.contentViews[1].frame = CGRect(x:self.bounds.minX + width + 20, y:self.bounds.minY + 100, width:self.bounds.width - width - 20, height:self.bounds.height - 100) //text
        
        
    }
    
    // MARK: Init Methods
    
    func commonInit() {
        
        let titleLabel: UILabel = UILabel();
        
        titleLabel.numberOfLines = 0;
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20);
        
        titleLabel.textAlignment = NSTextAlignment.natural;
        
        titleLabel.text = self.title;
        
        self.addSubview(titleLabel);
        
        self.contentViews.append(titleLabel);
        
        let content: UILabel = UILabel();
        
        content.numberOfLines = 0;
        
        content.font = UIFont.systemFont(ofSize: 20);
        
        content.textAlignment = NSTextAlignment.justified;
        
        content.text = self.text;
        
        self.addSubview(content);
        
        self.contentViews.append(content);
        
        if self.image != "" {
            if let url = URL(string: self.image) {
                do {
                    let img:UIImage? = try UIImage(data: Data.init(contentsOf: url))
                    let imgView:UIImageView = UIImageView(image: img)
                    self.addSubview(imgView)
                    self.contentViews.append(imgView)
                } catch {}
            }
        }
        
    }
    
    convenience init(title: String, text: String, image: String = "") {
        
        self.init(frame: CGRect.zero);
        
        self.text = text;
        
        self.title = title;
        
        self.image = image;
        
        self.commonInit();
        
    }

}
