//
//  CustomRowFormerViewController.swift
//  Former-Demo
//
//  Created by Ryo Aoyama on 8/29/15.
//  Copyright © 2015 Ryo Aoyama. All rights reserved.
//

import UIKit
import Former

final class CustomRowFormerViewController: FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        title = "Custom Example"
        
        // Create RowFormers
        
        let sliderRow = InlineSliderRowFormer<DemoInlineSliderCell>() {
            $0.titleLabel.text = "Inline Slider"
            $0.titleLabel.textColor = .formerColor()
            $0.titleLabel.font = .boldSystemFontOfSize(16)
        }
        
        // Create Headers and Footers
        
        let createHeader: (String -> ViewFormer) = { text in
            return LabelViewFormer<FormLabelHeaderView>() {
                $0.titleLabel.textColor = .grayColor()
                $0.titleLabel.font = .systemFontOfSize(14)
                }.configure {
                    $0.text = text
                    $0.viewHeight = 40
            }
        }
        
        // Create SectionFormers
        
        let section1 = SectionFormer(rowFormer: sliderRow)
            .set(headerViewFormer: createHeader("Custom Inline Slider Row"))
        
        former.append(sectionFormer: section1)
    }
}