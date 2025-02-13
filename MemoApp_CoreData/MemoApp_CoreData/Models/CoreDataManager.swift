//
//  CoreDataManager.swift
//  MemoApp_CoreData
//
//  Created by 박주성 on 2/13/25.
//

import UIKit
import CoreData

final class CoreDataManager {
    
    static let shared = CoreDataManager()
    private let modelName = "MemoEntity"
    
    private lazy var context: NSManagedObjectContext = {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("AppDelegate를 찾을 수 없음")
        }
        return appDelegate.persistentContainer.viewContext
    }()
    
    // CREATE
    func createMemo(content: String) {
        let memo = MemoEntity(context: context)
        memo.content = content
        memo.date = Date()
        
        do {
            try context.save()
        } catch {
            print("메모 저장 실패: \(error.localizedDescription)")
        }
    }
    
    // READ
    func fetchMemos() -> [MemoEntity] {
        let request = NSFetchRequest<MemoEntity>(entityName: self.modelName)
        request.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]
        
        do {
            return try context.fetch(request)
        } catch {
            print("메모 가져오기 실패: \(error.localizedDescription)")
            return []
        }
    }
    
    // UPDATE
    func updateMemo(memo: MemoEntity, newContent: String) {
        memo.content = newContent
        memo.date = Date()
        
        do {
            try context.save()
        } catch {
            print("메모 수정 실패: \(error.localizedDescription)")
        }
    }
    
    // DELETE
    func deleteMemo(memo: MemoEntity) {
        context.delete(memo)
        
        do {
            try context.save()
        } catch {
            print("메모 삭제 실패: \(error.localizedDescription)")
        }
    }
}
