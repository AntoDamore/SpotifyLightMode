//
//  Player.swift
//  S
//
//  Created by Antonio D'amore on 13/12/21.
//

import Foundation
import SwiftUI
import AVFoundation

struct DisplayContent: View {
     
    
   // Dummy Data
    var images : [UIImage]! = [
        UIImage(named: "album1")!,
        UIImage(named: "album2")!,
        UIImage(named: "album3")!,
        UIImage(named: "album4")!,
        UIImage(named: "album5")!,
        UIImage(named: "album6")!,
        UIImage(named: "album7")!,
    ]


    let albumName : [String] = ["Music To Be..",
                                "Justice",
                                "Dua Lipa",
                                "X",
                                "Natural Causes",
                                "Escape" ,
                                "Red"]
    
    let albumArtist : [String] = ["Eminem",
                                  "Justin Bieber",
                                  "Dua Lipa",
                                  "Ed Sheeran",
                                  "Skyler Grey",
                                  "Enrique Iglesias" ,
                                  "Taylor Swift"]
    
    var body: some View {
        VStack(spacing:1){
            
            HStack{
               Image("back")
                   Spacer()
            VStack{
            Text("Playing from ")
            Text("Favourites")
                .foregroundColor(.green)
            }
                Spacer()
                Image(systemName: "ellipsis")
                    .rotationEffect(.degrees(90))

            }
        ZStack{
        GeometryReader { fullView in
            ScrollView(.horizontal, showsIndicators: false) {
              
            
                HStack (spacing: 100) {
                    ForEach(0..<20) { index in
                        GeometryReader { geo in
                            
                            VStack{
                            Image(uiImage:self.images[index % 7])
                                .resizable()
                                .frame(width: 255, height: 288)
                                .cornerRadius(15)
                                .rotation3DEffect(.degrees(-Double(geo.frame(in: .global).midX - fullView.size.width / 2) / 10),axis: (x: 0, y:1, z: 0))
                                .position(x: 9, y: 150)
                               
                            
                            }
                        }
//                        .modifier(ScrollingHStackModifier(items: 20, itemWidth: 50, itemSpacing: 1))
//                        .frame(width: 150)
                        .padding(70)
                    }
                }              .padding(.horizontal, (fullView.size.width - 130) / 10)
           
            }
         
        }
        .ignoresSafeArea()
         
            MusicPlayer()
                .padding(.top,200)
            HStack{
           
            
                Image("device")
                    .padding(.trailing,320)
                    .padding(.top,600)
                   
                Image("queue")
                    .padding(.top,600)

                    
            }
                
        }
           

            }
        .padding(50)
       
    }
}


struct MusicPlayer : View {
    
    @State var data : Data = .init(count: 0)
    @State var title = ""
    @State var author = ""
    @State var player : AVAudioPlayer!
    @State var playing = false
    @State var width : CGFloat = 0
    @State var songs = ["Boom","Bad Blood"]
    @State var current = 0
    @State var finish = false
    @State var del = AVdelegate()
    @State var tap = false
    var body : some View{
        
        VStack(spacing: 10){
            Spacer(minLength: 150)
        ZStack{
                HStack{
            VStack{
                
            Text(self.title)
                .font(.largeTitle)
                .fontWeight(.bold)
                
                Text(self.author)
                    .font(.title)
                    .fontWeight(.regular)
                
            }
            .padding(.leading,90)
                    
                    Button(action: {
                        tap.toggle()
                        
                    } , label: {
                            if tap  {
                                Image(systemName: "heart.fill")
                                .font(.title)
                                .foregroundColor(.green)
                                .padding(.leading,40)
                            
                        }
                           else
                        {
                        Image(systemName: "heart")
                            .font(.title)
                            .foregroundColor(.green)
                            .padding(.leading,40)
                    }
                        
                    } )
                    
                }
           
            
            }
            ZStack(alignment: .leading) {
            
                Capsule().fill(Color.black.opacity(0.08)).frame(height: 10)
                    
                
                Capsule()
                    .fill(Color.green)
                    .frame(width: self.width, height: 8)
                    
                .gesture(DragGesture()
                    .onChanged({ (value) in
                    
                        let x = value.location.x
                        
                        self.width = x
                        
                    }).onEnded({ (value) in
                        
                        let x = value.location.x
                        
                        let screen = UIScreen.main.bounds.width - 30
                        
                        let percent = x / screen
                        
                        self.player.currentTime = Double(percent) * self.player.duration
                    }))
         
                
            }
            .padding(.top,10)
            
           
            
            HStack(spacing: UIScreen.main.bounds.width / 5 - 40){
                
                
                
                    Button(action: {
                        
                        self.player.currentTime -= 15
                        
                    }) {
                
                        Image(systemName: "shuffle").font(.title)
                        
                    }
             
                    
                Button(action: {
                    
                    if self.current > 0{
                        
                        self.current -= 1
                        
                        self.ChangeSongs()
                    }
                    
                }) {
            
                    Image(systemName: "backward.fill")
                        .font(.title)
                    
                }
                    Button(action: {
                        
                        if self.player.isPlaying{
                            
                            self.player.pause()
                            self.playing = false
                        }
                        else{
                            
                            if self.finish{
                                
                                self.player.currentTime = 0
                                self.width = 0
                                self.finish = false
                                
                            }
                            
                            self.player.play()
                            self.playing = true
                        }
                        
                    }) {
                   
                        Image(systemName: self.playing && !self.finish ? "pause.circle.fill" : "play.circle.fill")
                            .font(.system(size: 40))
                    }
                
                   
                    Button(action: {
                        
                        if self.songs.count - 1 != self.current{
                            
                            self.current += 1
                            
                            self.ChangeSongs()
                        }
                        
                    }) {
                
                        Image(systemName: "forward.fill").font(.title)
                        
                    }
//                ScrollViewReader { value in
                   

                Button(action: {
                   
                    let increase = self.player.currentTime + 15
                    
                    if increase < self.player.duration{
                        
                        self.player.currentTime = increase
                    }
                    
                }) {
            
                    Image(systemName: "repeat").font(.title)
                    
//                }
            
                }
            }
            .padding(.top,25)
    
            .foregroundColor(.black)
            Spacer()

        }
        .padding()
        .onAppear {
            
            let url = Bundle.main.path(forResource: self.songs[self.current], ofType: "mp3")
            
            self.player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: url!))
            
            self.player.delegate = self.del
            
            self.player.prepareToPlay()
            self.getData()
            
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (_) in
                
                if self.player.isPlaying{
                    
                    let screen = UIScreen.main.bounds.width - 30
                    
                    let value = self.player.currentTime / self.player.duration
                    
                    self.width = screen * CGFloat(value)
                }
            }
            
            NotificationCenter.default.addObserver(forName: NSNotification.Name("Finish"), object: nil, queue: .main) { (_) in
                
                self.finish = true
            }
        }
    }
    
    func getData(){
        
        
        let asset = AVAsset(url: self.player.url!)
        
        for i in asset.commonMetadata{
            
            if i.commonKey?.rawValue == "artwork"{
                
                let data = i.value as! Data
                self.data = data
            }
            
            if i.commonKey?.rawValue == "title"{
                
                let title = i.value as! String
                self.title = title
            }
            
            if i.commonKey?.rawValue == "artist"{
                
                let artist = i.value as! String
                self.author = artist
            }
        }
    }
    
    func ChangeSongs(){
        let url = Bundle.main.path(forResource: self.songs[self.current], ofType: "mp3")
        
        self.player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: url!))
        
        self.player.delegate = self.del
        
        self.data = .init(count: 0)
        
        self.title = ""
        
        self.player.prepareToPlay()
        self.getData()
        
        self.playing = true
        
        self.finish = false
        
        self.width = 0
        
        self.player.play()
    }
}

class AVdelegate : NSObject,AVAudioPlayerDelegate{
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        
        NotificationCenter.default.post(name: NSNotification.Name("Finish"), object: nil)
    }
}



struct Previews_Player_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
