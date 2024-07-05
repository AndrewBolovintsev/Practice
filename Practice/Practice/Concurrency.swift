//
//  Concurrency.swift
//  Practice
//
//  Created by Андрей Боловинцев on 2.07.24.
//

import Foundation

func concurrency()  {
    do {
        try test()
    }
    catch {
        proccessError(error: error)
    }
    
    
    
    
    Task { await printAsync() }
    performOtherTasks()
    
    
    Task { await processData() }
    performOtherTasks()
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







enum NetworkConnection: Error {
    case num404
    case num500
}

func test() throws {
    throw NetworkConnection.num404
}

func proccessError(error: Error) {
    switch error {
    case NetworkConnection.num404:
        print("404")
    default:
        print("Not name error")
    }
}

func performOperation(_ operation: () throws -> Void) rethrows {
    try operation()
}
