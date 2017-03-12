//
//  FirstViewController.swift
//  natuallullaby
//
//  Created by Dou, Eddie on 3/12/17.
//  Copyright © 2017 GuDuTou. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    var arrayAudios = [AudioPlayer]()
    @IBOutlet weak var control: UISegmentedControl!
    //Default: Forest
    var audioFiles = ["small_stream.mp3","frog.mp3","rainforest.mp3"]
    //Sea
    override func viewDidLoad() {
        //Control segment via code
        control.removeAllSegments()
        control.insertSegment(withTitle: "森林", at: 0, animated: false)
        control.insertSegment(withTitle: "海洋", at: 1, animated: false)
        control.insertSegment(withTitle: "乡村", at: 2, animated: false)
        control.selectedSegmentIndex = 0
        control.addTarget(self, action: #selector(segmentDidchange(_:)),
                            for: .valueChanged)

        super.viewDidLoad()
        self.initAudioFiles()
    }

    func initAudioFiles() {
        arrayAudios.removeAll()
        do {
            for name in audioFiles {
                let sound = try AudioPlayer(fileName: name)
                sound.numberOfLoops = -1
                arrayAudios.append(sound)
            }

        } catch {
            print("Sound initialization failed")
        }
    }

    func segmentDidchange(_ segmented:UISegmentedControl){

        for sounds in arrayAudios {
            sounds.stop()
        }

        switch segmented.selectedSegmentIndex {
        case 0:
            audioFiles = ["small_stream.mp3","frog.mp3","rainforest.mp3"]
        case 1:
            audioFiles = ["wave.mp3","sea_mew.mp3"]
        case 2:
            audioFiles = ["countryside.mp3"]
        default:
            //Handle no selected
            audioFiles = ["small_stream.mp3","frog.mp3","rainforest.mp3"]
        }

        self.initAudioFiles()
    }

    @IBAction func playSoundPressed(sender: AnyObject) {
        for sounds in arrayAudios {
            sounds.play()
        }
    }

    @IBAction func stopSoundPressed(sender: AnyObject) {
        for sounds in arrayAudios {
            sounds.stop()
        }
    }


}

