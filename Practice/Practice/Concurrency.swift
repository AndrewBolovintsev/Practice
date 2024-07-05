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
