//
//  CollegeTableViewCell.swift
//  University(Open API, Review)
//
//  Created by Erik Jimenez on 4/26/22.
//

import UIKit

class CollegeTableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // Outlets
    @IBOutlet weak var nameLabel: UILabel!
    
    var college: Colleges? {
        didSet{
            updateViews()
        }
    }
    
    func updateViews() {
        guard let college = college else
        {return}
        nameLabel.text = college.name
        //        shortDescriptionTextView = college.shortDescription
        //        cityLabel = college.city
        //        stateAbbrLabel = college.stateAbbr
        //        websiteLabel = college.website
        //        roomAndBoardLabel = college.roomAndBoard
        //        acceptanceRateLabel = college.acceptanceRate
        //        privatePublicLabel = college.privatePublic
        //        similarCollegeDrop = college.similarColleges
    }
    
    func fetchAndUpdateImageView() {
        guard let campusImage = college?.campusImage else {return}
        CollegeController.fetchImage(urlString: campusImage) { (image) in
            DispatchQueue.main.async {
                // self.(campusImageLabel).image = image
            }
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

