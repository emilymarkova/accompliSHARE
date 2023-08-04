//
//  StudyView.swift
//  group_app
//
//  Created by Emily Markova on 8/3/23.
//

import SwiftUI

struct StudyView: View {
    @EnvironmentObject var pomodoroModel: TimerViewViewModel
    var body: some View {
        VStack {
            Text("Pomodoro Timer")
                .font(.title2.bold())
                .foregroundColor(.black)
            GeometryReader{ proxy in
                VStack(spacing: 15){
                    ZStack {
                        Circle()
                            .fill(.black.opacity(0.03))
                            .padding(-40)
                        Circle()
                            .trim(from: 0, to: pomodoroModel.progress)
                            .stroke(.black.opacity(0.03), lineWidth: 80)
                            .padding(-40)
                        //shadow
                        Circle()
                            .trim(from: 0, to: 0.5)
                            .stroke(Color(red: 223/255, green: 189/255, blue: 251/255), lineWidth:5)
                            .blur(radius:15)
                            .padding(-2)
                        Circle()
                            .fill(Color("BG"))
                        Circle()
                            .trim(from: 0, to: pomodoroModel.progress)
                            .stroke(Color(red: 223/255, green: 189/255, blue: 251/255).opacity(0.7), lineWidth:10)
                        GeometryReader{proxy in
                            let size = proxy.size
                            
                            Circle()
                                .fill(Color(red: 223/255, green: 189/255, blue: 251/255))
                                .frame(width: 30, height: 30)
                                .overlay(content : {
                                    Circle()
                                        .fill(.black)
                                        .padding(5)
                                })
                                .frame(width: size.width, height: size.height, alignment: .center)
                                .offset(x: size.height / 2)
                                .rotationEffect(.init(degrees: pomodoroModel.progress * 360))
                            
                            
                        }
                        Text(pomodoroModel.timerStringValue)
                            .font(.system(size: 45, weight: .light))
                            .rotationEffect(.init(degrees: 90))
                            .animation(.none, value: pomodoroModel.progress)
//                        .onTapGesture(perform: {
//                            pomodoroModel.progress = 0.5
//                        })
                    }
                    .padding(60)
                    .frame(height: proxy.size.width)
                    .rotationEffect(.init(degrees: -90))
                    .animation(.easeInOut, value: pomodoroModel.progress)

                    Button {
                        if pomodoroModel.isStarted {
                            pomodoroModel.stopTimer()
                            UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
                        } else {
                            pomodoroModel.addNewTimer  = true
                        }
                    } label : {
                        Image(systemName: !pomodoroModel.isStarted ? "timer" : "stop.fill")
                            .font(.largeTitle.bold())
                            .foregroundColor(.black)
                            .frame(width: 80, height: 80)
                            .background{
                                Circle()
                                    .fill(Color(red: 223/255, green: 189/255, blue: 251/255))
                            }
                            .shadow(color: Color(red: 223/255, green: 189/255, blue: 251/255), radius: 8, x: 0, y: 0)
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
        .overlay(content: {
            ZStack{
                Color.black
                    .opacity(pomodoroModel.addNewTimer ? 0.25 : 0)
                    .onTapGesture {
                        pomodoroModel.addNewTimer = false
                        pomodoroModel.hour = 0
                        pomodoroModel.minutes = 0
                        pomodoroModel.seconds = 0
                        pomodoroModel.addNewTimer = false
                    }
                NewTimerView()
                    .frame(maxHeight: .infinity, alignment: .bottom)
                    .offset(y: pomodoroModel.addNewTimer ? 0 : 400)
            }
            .animation(.easeInOut, value: pomodoroModel.addNewTimer)
        })
        .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect()){
            _ in
            if pomodoroModel.isStarted {
                pomodoroModel.updateTimer(  )
            }
        }
        .alert("Congratulations! You did it!!!", isPresented:
                $pomodoroModel.isFinished){
            Button("Start New", role: .cancel){
                pomodoroModel.stopTimer()
                pomodoroModel.addNewTimer = true
            }
            Button("Close", role: .destructive){
                pomodoroModel.stopTimer()
            }
        }
        
    }
    
    @ViewBuilder
    func NewTimerView() -> some View {
        VStack(spacing: 15) {
            Text("Add New Timer")
                .font(.title2.bold())
                .foregroundColor(.black)
                .padding(.top, 10)
            HStack {
                Text("\(pomodoroModel.hour) hr")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.black.opacity(0.3))
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .background {
                        Capsule()
                            .fill(.black.opacity(0.07))
                    }
                    .contextMenu{
                        ContextMenuOptions(maxValue: 12, hint: "hr") {value in
                            pomodoroModel.hour = value
                        }
                    }
                Text("\(pomodoroModel.minutes) min")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.black.opacity(0.3))
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .background {
                        Capsule()
                            .fill(.black.opacity(0.07))
                    }
                    .contextMenu{
                        ContextMenuOptions(maxValue: 60, hint: "min") {value in
                            pomodoroModel.minutes = value
                        }
                    }
                Text("\(pomodoroModel.seconds) sec")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.black.opacity(0.3))
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .background {
                        Capsule()
                            .fill(.black.opacity(0.07))
                    }
                    .contextMenu{
                        ContextMenuOptions(maxValue: 60, hint: "sec") {value in
                            pomodoroModel.seconds = value
                        }
                    }
            }
            .padding(.top, 20)
            
            Button {
                pomodoroModel.startTimer()
            } label: {
                Text("Save")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .padding(.horizontal, 100)
                    .padding(.vertical)
                    .background {
                        Capsule()
                            .fill(.black.opacity(0.07))
                    }
            }
            .disabled(pomodoroModel.seconds == 0)
            .opacity(pomodoroModel.seconds == 0 ? 0.5 : 1)
            .padding(.top)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background{
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(Color(red: 223/255, green: 189/255, blue: 251/255))
                .ignoresSafeArea()
            
        }
    }
    
    @ViewBuilder
    func ContextMenuOptions(maxValue: Int, hint: String, onClick: @escaping (Int) -> ()) -> some View {
        ForEach(0...maxValue, id: \.self){ value in
            Button("\(value) \(hint)"){
                onClick(value)
            }
        }
    }
}

struct StudyView_Previews: PreviewProvider {
    static var previews: some View {
        StudyView()
    }
}
