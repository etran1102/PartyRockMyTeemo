//
//  ViewController.swift
//  PartyRockApp
//
//  Created by Erick Tran on 7/26/17.
//  Copyright © 2017 Erick Tran. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var partyRocks = [PartyRock]()
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        
        let p1 = PartyRock(imageURL: "https://www.wavefm.com.au/images/stories/2015/04/redfoo.jpg", videoURL: "<embed src=\"https://www.youtube.com/embed/ev4bY1SkZLg\" frameborder=\"0\" allowfullscreen></embed>", videoTitle: "Where The Sun Goes Down")
        
        let p2 = PartyRock(imageURL: "https://vignette2.wikia.nocookie.net/leagueoflegends/images/a/a8/Teemo_CottontailSkin.jpg/revision/latest?cb=20160908014302", videoURL: "<embed src=\"https://www.youtube.com/embed/CsQ2o-Yjcjs\" frameborder=\"0\" allowfullscreen></embed>", videoTitle: "Teemo vs Volibear")
        
        let p3 = PartyRock(imageURL: "https://vignette2.wikia.nocookie.net/leagueoflegends/images/a/a8/Teemo_CottontailSkin.jpg/revision/latest?cb=20160908014302", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/D8V2CRoepo0\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Cottontail Teemo vs Battle Bunny Riven")
        
        let p4 = PartyRock(imageURL: "https://vignette2.wikia.nocookie.net/leagueoflegends/images/a/a8/Teemo_CottontailSkin.jpg/revision/latest?cb=20160908014302", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/EHgE4v53CRE\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Cottontail Teemo vs Galio")
        
        let p5 = PartyRock(imageURL: "https://vignette2.wikia.nocookie.net/leagueoflegends/images/a/a8/Teemo_CottontailSkin.jpg/revision/latest?cb=20160908014302", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/SzWjVsxcdyY\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Cottontail Teemo vs Arcade Riven")
        
        partyRocks.append(p1)
        partyRocks.append(p2)
        partyRocks.append(p3)
        partyRocks.append(p4)
        partyRocks.append(p5)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCell {
           
            let partyRock = partyRocks[indexPath.row]
            
            cell.updateUi(partyRock: partyRock)
            return cell
        } else {
            return UITableViewCell()
        }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocks.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let partyRock = partyRocks[indexPath.row]
        performSegue(withIdentifier: "VideoVC", sender: partyRock)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? VideoVC {
            if let party = sender as? PartyRock {
                destination.partyRock = party
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
}












