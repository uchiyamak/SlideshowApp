//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 内山和也 on 2018/07/29.
//  Copyright © 2018年 kazuya.uchiyama. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var timer: Timer!
    
    //画像番号
    var imageNo: Int = 0
    let imageNameArr = ["01.jpg", "02.jpg", "03.jpg", "04.jpg", "05.jpg"]
    
    //停止０、再生中１
    var playing = false
    
    @IBOutlet weak var label: UIButton!
    @IBAction func StartStop(_ sender: Any) {
        if playing == false {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateImage(_:)), userInfo: nil, repeats: true)
            label.setTitle("停止", for: .normal)  //.nomalの場合、何もしてない時。.はenum←集合を定義できる。選択項目が限定されている場合。
            StepBack.isEnabled = false
            MoveOn.isEnabled = false
            playing = true
        } else {
            self.timer.invalidate()
            label.setTitle("再生", for: .normal)
            StepBack.isEnabled = true
            MoveOn.isEnabled = true
            playing = false
        }
    }
    
    @IBOutlet weak var StepBack: UIButton!      //addtarget
    @IBAction func BackImg(_ sender: Any) {
        cngImg(plumi: -1)

    }
    
    @IBOutlet weak var MoveOn: UIButton!
    @IBAction func NextImg(_ sender: Any) {
        cngImg(plumi: 1)
    }
    
    func cngImg(plumi: Int){
        //画像Noを更新
        imageNo += plumi
        if imageNo == imageNameArr.count {
            imageNo = 0
        }
        else if imageNo == -1 {
            imageNo = imageNameArr.count - 1
        }
        //名前の取り出し
        let imgName = imageNameArr[imageNo]
        let showImg = UIImage(named: imgName)
        imageView.image = showImg
    }
    @objc func updateImage(_ timer: Timer) {   //@objcってなに？ timer、必要？　_ timer: Timer
        //次の画像に切り替える
        cngImg(plumi: 1)
    }
    
    @IBAction func onTapImg(_ sender: Any) {
        //次の画面を表示
        performSegue(withIdentifier:"result", sender: nil)  //詳しくはわからんが、いったん成功
        //スライドショーの途中で画像をタップしたらタイマーを止める
        if playing {
            self.timer.invalidate()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のshowImgを取得する
        let sendImg:showImg = segue.destination as! showImg
        // 遷移先のshowImgで宣言しているimgNameに画像の名前を渡す
        sendImg.imgName = imageNameArr[imageNo]
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        //もしもスライドショーから飛んでた場合、タイマーを再開
        if playing {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateImage(_:)), userInfo: nil, repeats: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let showImg = UIImage(named: "01.jpg")
        imageView.image = showImg
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

