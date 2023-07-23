

import UIKit
import AVFAudio

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    var songs=[Songs]()
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureSongs()
        
    }
    
    func configureSongs(){
        songs.append(Songs(name: "Zihal-e-Miskin (Slowed And Reverb)",
                           artistName: "Arjit Singh",
                           imageName: "Image1",
                           trackName: "Zihal-e-Miskin"))
        songs.append(Songs(name: "Mansoob By Kaifi Khalil Official Music",
                           artistName: "Kaifi Khalil",
                           imageName: "Image2",
                           trackName: "Mansoob"))
        songs.append(Songs(name: "Jai Wolf - Like It's Over (feat. MNDR)",
                           artistName: "MNDR",
                           imageName: "Image3",
                           trackName: "Wolf"))
        songs.append(Songs(name: "Zihal-e-Miskin (Slowed And Reverb)",
                           artistName: "Arjit Singh",
                           imageName: "Image1",
                           trackName: "Zihal-e-Miskin"))
        songs.append(Songs(name: "Mansoob By Kaifi Khalil Official Music",
                           artistName: "Kaifi Khalil",
                           imageName: "Image2",
                           trackName: "Mansoob"))
        songs.append(Songs(name: "Jai Wolf - Like It's Over (feat. MNDR)",
                           artistName: "MNDR",
                           imageName: "Image3",
                           trackName: "Wolf"))
        songs.append(Songs(name: "Zihal-e-Miskin (Slowed And Reverb)",
                           artistName: "Arjit Singh",
                           imageName: "Image1",
                           trackName: "Zihal-e-Miskin"))
        songs.append(Songs(name: "Mansoob By Kaifi Khalil Official Music",
                           artistName: "Kaifi Khalil",
                           imageName: "Image2",
                           trackName: "Mansoob"))
        songs.append(Songs(name: "Jai Wolf - Like It's Over (feat. MNDR)",
                           artistName: "MNDR",
                           imageName: "Image3",
                           trackName: "Wolf"))
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let song = songs[indexPath.row]
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.trackName
        cell.accessoryType = .disclosureIndicator
        cell.imageView?.image = UIImage(named: song.imageName)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let position = indexPath.row
        
        playSound(name: songs[position].name)
        
                
    }
    
    func playSound(name: String) {
        let url = Bundle.main.url(forResource: name, withExtension: "mp3")!

        do {
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }

            player.prepareToPlay()
            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }

}


struct Songs{
    let name:String
    let artistName:String
    let imageName:String
    let trackName:String
    
}

