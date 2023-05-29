//
//  CustomTableViewCell.swift
//  Task
//
//  Created by Anuj Soni on 27/05/23.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    static let identifier = "CustomCell"
    
    var height:Int = 90
    
    var width:Int = 90
    
    
    private let myimageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(systemName: "questionmark")
        iv.tintColor = .label
        return iv
    }()
    
    private let mylabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 24, weight:.medium)
        label.text = "Error"
        return label
    }()
    
    public func configure(with image: UIImage,label:String,height:Int, and width:Int){
        self.myimageView.image = image
        self.mylabel.text = label
        self.height = height
        self.width = width
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        self.contentView.addSubview(myimageView)
        self.contentView.addSubview(mylabel)
        
        myimageView.translatesAutoresizingMaskIntoConstraints = false
        mylabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            myimageView.topAnchor.constraint(equalTo:self.contentView.layoutMarginsGuide.topAnchor),
            myimageView.bottomAnchor.constraint(equalTo:self.contentView.layoutMarginsGuide.bottomAnchor),
            myimageView.leadingAnchor.constraint(equalTo:self.contentView.layoutMarginsGuide.leadingAnchor),
            
            myimageView.heightAnchor.constraint(equalToConstant:CGFloat(height)),
            myimageView.widthAnchor.constraint(equalToConstant:CGFloat(width)),
            
            
            mylabel.leadingAnchor.constraint(equalTo: self.myimageView.trailingAnchor,constant:16),
            mylabel.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor),
            mylabel.bottomAnchor.constraint(equalTo:self.contentView.bottomAnchor),
            mylabel.topAnchor.constraint(equalTo:self.contentView.topAnchor)
            
        ])
        
    }
    
    
    
    
}







