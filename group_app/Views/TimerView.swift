//
//  TimerView.swift
//  group_app
//
//  Created by Emily Markova on 8/2/23.
//

import SwiftUI

struct TimerView: View {
    @EnvironmentObject var timerModel: TimerViewViewModel
    var body: some View {
        StudyView()
            .environmentObject(timerModel)
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
