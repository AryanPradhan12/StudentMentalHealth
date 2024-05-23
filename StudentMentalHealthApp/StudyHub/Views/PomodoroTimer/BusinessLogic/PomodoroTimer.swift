//
//  PomodoroTimer.swift
//  StudentMentalHealthApp
//
//  Created by Aryan Pradhan on 19/05/2024.
//

import Foundation
import Observation

enum PomodoroTimerState: String {
    case idle
    case running
    case paused
}


enum PomodoroTimerMode: String {
    case work
    case pause
}

@Observable
class PomodoroTimer {
    // timer that ticks every second
    // properties that tell how many seconds left or passed
    // properties that tell seconds in a fraction from 0-1
    // express the time left as a String
    // methods -> play, pause, resume, reset, and skip
    // helper functions
    
    private var _mode: PomodoroTimerMode = .work
    private var _state: PomodoroTimerState = .idle
    
    private var _durationWork: TimeInterval
    private var _durationBreak: TimeInterval
    
    private var _secondsPassed: Int = 0
    private var _fractionPassed: Double = 0
    private var _dateStarted: Date = Date.now
    private var _secondsPassedBeforePause: Int = 0
    
    private var _timer: Timer?
    private var _audio: PomodoroAudio = PomodoroAudio()
    
    init(workInSeconds: TimeInterval, breakInSeconds: TimeInterval) {
        _durationWork = workInSeconds
        _durationBreak = breakInSeconds
    }
    //MARK: computed properties
    var secondsPassed: Int {
        return _secondsPassed
    }
    var secondsPassedString: String {
        return _formatSeconds(_secondsPassed)
    }
    var secondsLeft: Int {
        Int(_duration) - _secondsPassed
    }
    var secondsLeftString: String {
        return _formatSeconds(secondsLeft)
    }
    var fractionPassed: Double {
        return _fractionPassed
    }
    var fractionLeft: Double {
        1.0 - _fractionPassed
    }
    
    var state: PomodoroTimerState {
        _state
    }
    var mode: PomodoroTimerMode {
        _mode
    }
    
    private var _duration: TimeInterval {
        if mode == .work {
            return _durationWork
        } else {
            return _durationBreak
        }
    }
    
    // MARK: Public Methods
    func start() {
        _dateStarted = Date.now
        _secondsPassed = 0
        _fractionPassed = 0
        _state = .running
        _createTimer()
    }
    func resume() {
        _dateStarted = Date.now
        _state = .running
        _createTimer()
    }
    func pause() {
        _secondsPassedBeforePause = _secondsPassed
        _state = .paused
        _killTimer()
    }
    func reset() {
        _secondsPassed = 0
        _fractionPassed = 0
        _secondsPassedBeforePause = 0
        _state = .idle
        _killTimer()
    }
    func skip() {
        if self._mode == .work {
            self._mode = .pause
        } else {
            self._mode = .work
        }
    }
    
    //MARK: private methods
    private func _createTimer() {
        // schedule notification
        PomodoroNotification.scheduleNotification(seconds: TimeInterval(secondsLeft), title: "Timer Done", body: "Pomodoro Timer is finished...")
        // create timer
        _timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self._onTick()
        }
    }
    
    private func _killTimer() {
        _timer?.invalidate()
        _timer = nil
    }
    
    private func _onTick() {
        // calculate the seconds since start date
        let secondsSinceStartDate = Date.now.timeIntervalSince(self._dateStarted)
        // add the seconds before paused
        self._secondsPassed = Int(secondsSinceStartDate) + self._secondsPassedBeforePause
        // calculate the fraction
        self._fractionPassed = TimeInterval(self._secondsPassed) / self._duration
        // play tick sound
        _audio.play(.tick)
        // if done -> play sound, reset, switch (work -> pause -> work), reset timer
        if self.secondsLeft == 0 {
            self._fractionPassed = 0
            self.skip() // to switch mode
            self.reset() // also resets timer
            _audio.play(.done) // play ending sound
        }
    }
    
    private func _formatSeconds(_ seconds: Int) -> String {
        if seconds <= 0 {
            return "00:00"
        }
        let hh: Int = seconds / 3600
        let mm: Int = (seconds % 3600) / 60
        let ss: Int = seconds % 60
        if hh > 0 {
            return String(format: "%02d:%02d:%02d", hh, mm, ss)
        } else {
            return String(format: "%02d:%02d", mm, ss)
        }
    }
}
