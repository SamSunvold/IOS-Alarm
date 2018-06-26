//
//  ViewController.swift
//  AlarmMk2
//
//  Created by Sam on 6/12/18.
//  Copyright © 2018 Sam. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var alarmSet = true
    
    @IBOutlet var songCollection: [UIButton]!
    
    var alarm = AVAudioPlayer()
    var audioPathFile = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Tornado_Siren_II-Delilah-747233690", ofType: "wav")!)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        do
        {
            alarm = try AVAudioPlayer(contentsOfURL: audioPathFile)
        
        }
        catch
        {
            print("Error")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func setOffAlarm(sender: AnyObject) {
        if alarmSet
        {
            alarm.play()
            alarmSet = false
        }
        else
        {
            alarm.stop()
            alarmSet = true
        }
        
    }

    @IBAction func alarmForAllNotifications(sender: AnyObject) {
    }
    
    
    @IBAction func selectSoundButton(sender: UIButton) {
        songCollection.forEach { (button)-> () in
            UIView.animateWithDuration(0.5, animations:
            {
                button.hidden = !button.hidden
            })
        }
    }
    
    enum Songs: String
    {
        case songOne = "Song one"
        case songTwo = "Song two"
        case songThree = "Song three"
    }
    
    @IBAction func chooseSong(sender: UIButton) {
        guard let title = sender.currentTitle,
        let song = Songs(rawValue: title)
        else
        {
            return
        }
        
        switch song{
        case .songOne:
                audioPathFile = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Tornado_Siren_II-Delilah-747233690", ofType: "wav")!)
                do
                {
                    alarm = try AVAudioPlayer(contentsOfURL: audioPathFile)
                    
                }
                catch
                {
                    print("Error")
            }

        case .songTwo:
            audioPathFile = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Ship_Brass_Bell-Mike_Koenig-1458750630", ofType: "mp3")!)
            do
            {
                alarm = try AVAudioPlayer(contentsOfURL: audioPathFile)
                
            }
            catch
            {
                print("Error")
            }

        case .songThree:
            audioPathFile = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("gentex_cammander_3_code_3_horn-Brandon-938131891", ofType: "mp3")!)
            do
            {
                alarm = try AVAudioPlayer(contentsOfURL: audioPathFile)
                
            }
            catch
            {
                print("Error")
            }

        }
     
    }
    
}

