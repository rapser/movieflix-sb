//
//  File.swift
//  movieflix
//
//  Created by miguel tomairo on 18/03/22.
//

import UIKit
import YouTubeiOSPlayerHelper
import AVFoundation

class PlayerViewController: UIViewController, YTPlayerViewDelegate {

    @IBOutlet weak var playbutton: UIButton!
    @IBOutlet weak var playerView: YTPlayerView!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var controlView: UIView!
    
    var player: AVPlayer!
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return .landscapeRight
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let key = MovieViewModel.shared.video.first?.key else { return }
        print(key)
        self.playerView.delegate = self
        playerView.load(withVideoId: key, playerVars: ["playsinline": "1"])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
}
