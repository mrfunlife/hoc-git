//
//  CustomButton.swift
//  Siru
//
//  Created by Lê Hà Thành on 1/31/18.
//  Copyright © 2018 Rikkeisoft. All rights reserved.
//

import UIKit


// Day la loc01 da sua
enum ButtonType {
    case border
    case borderAndBackground
    case background
    case border_1
    case none
    case notSetting
}

struct ButtonStruct {
    var defaultBorderColor: UIColor = GREEN_COLOR
    var selectedBorderColor: UIColor = GREEN_COLOR
    var borderWidth: CGFloat = 2
    
    var defaultTextColor: UIColor = GREEN_COLOR
    var defaultBgColor: UIColor = GREEN_COLOR
    
    var seledtedTextColor: UIColor = GREEN_COLOR
    var selectedBgColor: UIColor = GREEN_COLOR
    
    var type: ButtonType! = .background
    init(type: ButtonType) {
        self.type = type
        switch type {
        case .border:
            defaultBorderColor = GRAY_COLOR
            defaultTextColor = UIColor(hexString: BLACK_COLOR)
            defaultBgColor = .clear
            
            selectedBorderColor = GREEN_COLOR
            seledtedTextColor = GREEN_COLOR
            selectedBgColor = .clear
        case .borderAndBackground:
            defaultBorderColor = GRAY_COLOR
            defaultTextColor = UIColor(hexString: BLACK_COLOR)
            defaultBgColor = .clear
            
            selectedBorderColor = GREEN_COLOR
            seledtedTextColor = .white
            selectedBgColor = GREEN_COLOR
        case .background:
            defaultBorderColor = GREEN_COLOR
            defaultTextColor = GREEN_COLOR
            defaultBgColor = .clear
            
            selectedBorderColor = GREEN_COLOR
            seledtedTextColor = .white
            selectedBgColor = GREEN_COLOR
        case .border_1:
            defaultBorderColor = GRAY_COLOR
            defaultTextColor = UIColor(hexString: BLACK_COLOR)
            defaultBgColor = .clear
            
            selectedBorderColor = GREEN_COLOR
            seledtedTextColor = GREEN_COLOR
            selectedBgColor = .clear
        case .none:
            defaultTextColor = GRAY_COLOR
            defaultBgColor = .clear
            seledtedTextColor = GREEN_COLOR
        case .notSetting:
            break
        }
    }
}

class CustomButton: UIButton {
    var buttonStruct : ButtonStruct?

    func setData(buttonStruct: ButtonStruct) {
        self.buttonStruct = buttonStruct
        if buttonStruct.type != ButtonType.notSetting {
            if buttonStruct.type == ButtonType.none {
                setImage(#imageLiteral(resourceName: "ic_arrow_right_gray"), for: .normal)
                setImage(#imageLiteral(resourceName: "ic_arrow_right_green"), for: .highlighted)
                setTitleColor(UIColor(hexString: BLACK_COLOR), for: .normal)
                setTitleColor(GREEN_COLOR, for: .highlighted)
            } else {
                addCornerRadius()
                layer.borderColor = buttonStruct.defaultBorderColor.cgColor
                setTitleColor(buttonStruct.defaultTextColor, for: .normal)
            }
        } else {
            addCornerRadius()
        }
    }
    
    private func addCornerRadius(){
        clipsToBounds = true
        layer.cornerRadius = self.bounds.size.height / 2
        layer.borderWidth = 2
    }
    
    override var isHighlighted: Bool {
        didSet {
            if let buttonStruct = buttonStruct,
                (buttonStruct.type != ButtonType.none && buttonStruct.type != ButtonType.border_1) {
                    super.isHighlighted = false
                
            }
            
            if let buttonStruct = buttonStruct, buttonStruct.type == ButtonType.border_1 {
                isSelected = isHighlighted
            }
        }
    }
    
    override var isSelected: Bool {
        didSet {
            if let buttonStruct = buttonStruct, buttonStruct.type != ButtonType.notSetting{
                if buttonStruct.type != ButtonType.none {
                    if isSelected {
                        backgroundColor = buttonStruct.selectedBgColor
                        setTitleColor(buttonStruct.seledtedTextColor, for: .normal)
                        layer.borderColor = buttonStruct.selectedBorderColor.cgColor
                    } else {
                        backgroundColor = buttonStruct.defaultBgColor
                        setTitleColor(buttonStruct.defaultTextColor, for: .normal)
                        layer.borderColor = buttonStruct.defaultBorderColor.cgColor
                    }
                }
            }
        }
    }
}
