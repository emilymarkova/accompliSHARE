//
//  StudyView.swift
//  group_app
//
//  Created by Emily Markova on 8/2/23.
//

import SwiftUI

struct StudyView: View {
    @EnvironmentObject var timerModel: TimerViewViewModel
    var body: some View {
        VStack{
            GeometryReader{proxy in
                VStack(spacing:15){
                    //timer ring
                    ZStack{
                        Circle()
                            .fill(.white.opacity(0.03))
                            .padding(-40)
                        Circle()
                            .trim(from: 0, to: timerModel.progress)
                            .stroke(.white.opacity(0.03), lineWidth: 80)
                        //shadow
                        Circle()
                            .trim(from: 0, to: 0.5)
                            .stroke(Color("Purple"), lineWidth: 5)
                            .blur(radius: 15)
                            .padding(-2)
                        Circle()
                            .fill(Color("BG"))
                        Circle()
                            .trim(from: 0, to: timerModel.progress)
                            .stroke(Color("Purple").opacity(0.7), lineWidth: 10)
                        //knob(circle on the outside)
                        GeometryReader{proxy in
                            let size = proxy.size

                            Circle()
                                .fill(Color("Purple"))
                                .frame(width: 30, height: 30)
                                .overlay(content: {
                                    Circle()
                                        .fill(.white)
                                        .padding(5)
                                })
                                .frame(width: size.width, height: size.height, alignment: .center)
                                .offset(x: size.height / 2)
                                .rotationEffect(.init(degrees: timerModel.progress * 360))
                        }
                        Text(timerModel.timerStringValue)
                            .font(.system(size: 45, weight: .light))
                            .rotationEffect(.init(degrees: 90))
                            .animation(.none, value: timerModel.progress)

                    }
                    .padding(60)
                    .frame(height: proxy.size.width)
                    .rotationEffect(.init(degrees: -90))
                    .animation(.easeInOut, value: timerModel.progress)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    Button {
                        if timerModel.isStarted {
                            timerModel.stopTimer()
                        } else{
                            timerModel.addNewTimer = true
                        }
                    } label : {
                        Image(systemName: !timerModel.isStarted ? "timer" : "pause")
                            .font(.largeTitle.bold())
                            .foregroundColor(.white)
                            .frame(width: 80, height: 80)
                            .background {
                                Circle()
                                    .fill(Color("Purple"))
                            }
                            .shadow(color: Color("Purple"), radius: 8, x:0, y:0)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            }

        }
        .padding()
        .background{
            Color("BG")
                .ignoresSafeArea()
        }
        .overlay(
            ZStack{
                Color.black
                    .opacity(timerModel.addNewTimer ? 0.25 : 0)
                    .ignoresSafeArea(.all) // Ensure it ignores safe area
                    .onTapGesture {
                        timerModel.hour = 0
                        timerModel.minutes = 0
                        timerModel.seconds = 0
                        timerModel.addNewTimer = false
                    }
                NewTimerView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom) // Make it cover the whole screen
                    .offset(y: timerModel.addNewTimer ? 0 : 400)
            }
            .animation(.easeInOut, value: timerModel.addNewTimer)
        )
        .preferredColorScheme(.dark)
        .onReceive(Timer.publish(every: 1, on:  .main, in: .common).autoconnect()){
            _ in
            if timerModel.isStarted{
                timerModel.updateTimer()
            }
        }
        .alert("Congratulations! You did it!", isPresented: $timerModel.isFinished){
            Button("Keep Going", role: .cancel){
                timerModel.stopTimer()
                timerModel.addNewTimer = true
            }
            Button("Finish", role: .destructive){
                timerModel.stopTimer()
            }

        }
        
    }
    //new timer bottom sheet
    @ViewBuilder
    func NewTimerView() -> some View {
        VStack(spacing: 15){
            Text("Pomodoro Timer")
                .font(.title2.bold())
                .foregroundColor(.white)
                .padding(.top, 10)
            HStack(spacing: 15) {
                Text("\(timerModel.hour) hr")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.white.opacity(0.3))
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .background{
                        Capsule()
                            .fill(.white.opacity(0.07))
                    }
                    .contextMenu{
                        ContextMenuOptions(maxValue: 12, hint: "hr"){value in
                            timerModel.hour = value
                        }
                    }

                Text("\(timerModel.minutes) min")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.white.opacity(0.3))
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .background{
                        Capsule()
                            .fill(.white.opacity(0.07))
                    }
                    .contextMenu{
                        ContextMenuOptions(maxValue: 60, hint: "min"){value in
                            timerModel.minutes = value
                        }
                    }

                Text("\(timerModel.seconds) sec")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.white.opacity(0.3))
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .background{
                        Capsule()
                            .fill(.white.opacity(0.07))
                    }
                    .contextMenu{
                        ContextMenuOptions(maxValue: 60, hint: "sec"){value in
                            timerModel.seconds = value
                        }
                    }
            }
            .padding(.top, 20)
            Button {
                timerModel.startTimer()
            } label : {
                Text("Save")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.vertical)
                    .padding(.horizontal, 100)
                    .background{
                        Capsule()
                            .fill(Color("Purple"))
                    }
            }
            .disabled(timerModel.seconds == 0)
            .opacity(timerModel.seconds == 0 ? 0.5 : 1)
            .padding(.top)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.black) // Set the background color to opaque black
        .ignoresSafeArea()
    }
    //reusable context menu options
    @ViewBuilder
    func ContextMenuOptions(maxValue: Int, hint: String, onClick: @escaping (Int)->()) -> some View{
        ForEach(0...maxValue, id: \.self){value in
            Button("\(value) \(hint)"){
                onClick(value)
            }
        }
    }
}

struct StudyView_Previews: PreviewProvider {
    static var previews: some View {
        StudyView()
            .environmentObject(TimerViewViewModel())
    }
}
