//
//  Concurrency.swift
//  Practice
//
//  Created by Андрей Боловинцев on 2.07.24.
//

import Foundation

func concurrency()  {
    
    Task { await printAsync() }
    performOtherTasks()
    
    
    Task { await processData() }
    performOtherTasks()
    
    
    Task {
        print("Starting sequential tasks")
        await Task.sleep(3)
        print("Completed 3 seconds wait")
        await Task.sleep(4)
        print("Completed 4 seconds wait")
        await Task.sleep(5)
        print("Completed 5 seconds wait")
        print("All sequential tasks completed")
        
        print("Starting parallel tasks")
        async let waitAsync1 = Task.sleep(3)
        async let waitAsync2 = Task.sleep(4)
        async let waitAsync3 = Task.sleep(5)
        await waitAsync1
        print("Completed 3 seconds wait")
        await waitAsync2
        print("Completed 4 seconds wait")
        await waitAsync3
        print("Completed 5 seconds wait")
        print("All parallel tasks completed")
    }
    
    
    
    Task {
        let results = await executeTasks()
        print("Final Results: \(results)")
    }
    
    
    
    let logger = TemperatureLogger(label: "Outdoors", measurement: 25)
    Task { print(await logger.max) }
    
    Task {
        let logger = TemperatureLogger(label: "Tea kettle", measurement: 85)
        let reading = TemperatureReading(measurement: 45)
        await logger.addReading(from: reading)
        print(await logger.max)
    }
    
}

func performOtherTasks() {
    for i in 1...5 {
        print("Выполнение другой задачи \(i)")
        sleep(1)
    }
}

func printAsync() async {
    print("Начало выполнения задач.")
    await waitFor(seconds: 3)
    print("Первая задача завершена.")
    await waitFor(seconds: 5)
    print("Вторая задача завершена.")
    print("Все задачи выполнены.")
}

func waitFor(seconds: Int) async {
    print("Начинаем ожидание \(seconds) секунд...")
    await Task.sleep(UInt64(seconds) * 1_000_000_000)
    print("Ожидание завершено!")
}


enum SimpleError: Error {
    case somethingWentWrong
}
func doSomethingAsync() async throws -> String {
    
    try await Task.sleep(nanoseconds: 2 * 1_000_000_000)
    
    let success = Bool.random()
    if success {
        return "Успешное выполнение"
    } else {
        throw SimpleError.somethingWentWrong
    }
}
func processData() async {
    do {
        let result = try await doSomethingAsync()
        print("Результат: \(result)")
    } catch {
        print("Произошла ошибка: \(error)")
    }
}



func executeTasks() async -> [String] {
    var results: [String] = []
    
    await withTaskGroup(of: Optional<String>.self) { group in
        for i in 1...5 {
            group.addTask {
                return await performAsyncTask(named: "Task \(i)")
            }
        }
        
        for await result in group {
            if let result = result {
                results.append(result)
            }
        }
    }
    
    return results
}
func performAsyncTask(named name: String) async -> String? {
    let delay = UInt64.random(in: 1...5)
    print("\(name): Sleeping for \(delay) seconds...")
    try? await Task.sleep(nanoseconds: delay * 1_000_000)
    
    let randomNumber = Int.random(in: 1...5)
    if randomNumber == 3 {
        print("\(name): Task is cancelled due to random number 3.")
        do {
            try Task.checkCancellation()
        } catch {
            print("\(name): Task was cancelled.")
            return nil
        }
    }
    
    print("\(name): Completed with random number \(randomNumber).")
    return "\(name): Result"
}



actor TemperatureLogger {
    
    let label: String
    var measurements: [Int]
    private(set) var max: Int
    
    init(label: String, measurement: Int) {
        self.label = label
        self.measurements = [measurement]
        self.max = measurement
    }
    
    func convertFahrenheitToCelsius() {
        measurements = measurements.map { measurement in
            (measurement - 32) * 5 / 9
        }
    }
}

struct TemperatureReading: Sendable {
    var measurement: Int
}
extension TemperatureLogger {
    func addReading(from reading: TemperatureReading) {
        measurements.append(reading.measurement)
    }
}
struct FileDescriptor {
    let rawValue: CInt
}
@available(*, unavailable)
extension FileDescriptor: Sendable { }
