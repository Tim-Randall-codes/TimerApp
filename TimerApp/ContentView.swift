//
//  ContentView.swift
//  TimerApp
//
//  Created by Tim Randall on 14/10/21.
//

import SwiftUI

struct ContentView: View {
    @State var seconds: Int = 60
    @State var pause: Bool = false
    var body: some View {
        VStack{
            Text(String(seconds))
                .padding()
            Button(action:{
                pause = false
                countDown()
            }, label:{
                Text("Start timer").padding()
            })
            Button(action:{
                if pause == false {
                    pause = true
                }
                else {
                    pause = false
                    countDown()
                }
            }, label: {
                Text("pause").padding()
            })
            Button(action:{
                pause = true
                seconds = 60
            }, label: {
                Text("stop/reset").padding()
            })
        }
    }
    func countDown(){
        //this function will subtract one from seconds each second, the @state variable will
        //help display this. It will go into negatives after zero.
        let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            seconds -= 1
            if seconds == 0 {
                timer.invalidate()
            }
            if pause == true {
                timer.invalidate()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
