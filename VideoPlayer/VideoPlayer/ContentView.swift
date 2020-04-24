//
//  ContentView.swift
//  VideoPlayer
//
//  Created by BLCKBIRDS on 23.04.20.
//  Copyright © 2020 BLCKBIRDS. All rights reserved.
//

import SwiftUI
import AVKit

struct ContentView: View {
    var body: some View {
        ZStack {
            PlayerView()
                .background(Color.black)
                .blur(radius: 2)
                .overlay(Color.green.opacity(0.3))
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Image(systemName: "paperplane.fill")
                    .resizable()
                    .frame(width: 70, height: 70)
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                    .padding(.bottom, 30)
                Text("Explore the World")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                Text("Discover the most amazing places in the world and share your experience with the No. 1 travel community.")
                    .foregroundColor(.white)
                    .frame(maxWidth: 320)
                    .padding(.top, 20)
                    .padding(.bottom, 50)
                Spacer()
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.white)
                HStack {
                    Spacer()
                    Text("Login")
                        .foregroundColor(.white)
                        .padding(20)
                    Spacer()
                    Text("Signup")
                        .foregroundColor(.white)
                        .padding(20)
                    Spacer()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct PlayerView: UIViewRepresentable {
    
  func makeUIView(context: Context) -> UIView {
    return PlayerUIView(frame: .zero)
  }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PlayerView>) {
    }
}

class PlayerUIView: UIView {
  private let playerLayer = AVPlayerLayer()
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    let url = URL(string: "https://blckbirds.com/wp-content/uploads/2020/04/video.mp4")!
    let player = AVPlayer(url: url)
    player.isMuted = true
    player.play()
    
    playerLayer.player = player
    playerLayer.videoGravity = AVLayerVideoGravity(rawValue: AVLayerVideoGravity.resizeAspectFill.rawValue)
    layer.addSublayer(playerLayer)
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  override func layoutSubviews() {
    super.layoutSubviews()
    playerLayer.frame = bounds
  }
}
