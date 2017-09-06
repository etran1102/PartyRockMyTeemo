//
//  PartyCellTableViewCell.swift
//  PartyRockApp
//
//  Created by Erick Tran on 7/26/17.
//  Copyright © 2017 Erick Tran. All rights reserved.
//

import UIKit

class PartyCell: UITableViewCell {

    @IBOutlet weak var videoPreviewImage: UIImageView!
    
    @IBOutlet weak var videoTitle: UILabel!    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    func updateUi(partyRock: PartyRock) {
        videoTitle.text = partyRock.videoTitle
        //TODO: set image from url
        
        let url = URL(string: partyRock.imageURL)!
        
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                DispatchQueue.global().sync {
                    self.videoPreviewImage.image = UIImage(data: data)
                }
            } catch {
               //handle the error
            }
        }
        
    }

}
