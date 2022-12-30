//
//  RalmManager.swift
//  Todo-app
//
//  Created by md imran on 31/12/22.
//

import Foundation
import RealmSwift


class RealmManager: ObservableObject {
    private (set) var localRealm: Realm?
    @Published private(set) var tasks: [Task] = []
    
    init() {
        openRealm()
        getTask()
    }
    
    func openRealm() {
        do{
            let config = Realm.Configuration(schemaVersion: 1, migrationBlock: { migration, oldSchemaVersion in
                
            })
            Realm.Configuration.defaultConfiguration = config
            
            localRealm = try Realm()
        } catch {
            print("Error \(error)")
        }
    }
    
    func addTask(taskTitle: String) {
        if let localRealm = localRealm {
            do {
                try localRealm.write {
                    let newTask = Task(value: ["title": taskTitle, "completed": false])
                    localRealm.add(newTask)
                    getTask()
                    print("Added new task \(newTask)")
                }
            } catch {
                print("Error \(error)")
            }
        }
    }
    
    
    func getTask() {
        if let localRealm = localRealm {
            let allTask = localRealm.objects(Task.self).sorted(byKeyPath: "completed")
            tasks = []
            allTask.forEach { item in
                tasks.append(item)
            }
        }
    }
    
    func updateTask(id: ObjectId, completed: Bool) {
        if let localRealm = localRealm {
            do {
                let taskToUpdate = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id))
                guard !taskToUpdate.isEmpty else {return}
                
                try localRealm.write {
                    taskToUpdate[0].completed = completed
                    getTask()
                    print("\(id) \(completed)")
                }
            } catch {
                print("Error \(error)")
            }
        }
    }
    
    
    func deleteTask(id: ObjectId) {
        if let localRealm = localRealm {
            do {
                let taskToUpdate = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id))
                guard !taskToUpdate.isEmpty else {return}
                
                try localRealm.write {
                    localRealm.delete(taskToUpdate)
                    getTask()
                    print("\(id)")
                }
            } catch {
                print("Error \(error)")
            }
        }
    }
}
