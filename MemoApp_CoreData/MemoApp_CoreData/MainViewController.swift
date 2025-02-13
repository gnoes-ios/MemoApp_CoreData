//
//  MainViewController.swift
//  MemoApp_CoreData
//
//  Created by 박주성 on 2/13/25.
//

import UIKit

class MainViewController: UIViewController {

    private var memoList: [MemoEntity] = []
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupNavigationBar()
        setupTableView()
        fetchMemos()
    }
    
    private func setupUI() {
        title = "메모 앱"
        view.backgroundColor = .white
    }
    
    private func setupNavigationBar() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addMemo))
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        setTableViewAutoLayout()
    }
    
    private func setTableViewAutoLayout() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func fetchMemos() {
        memoList = CoreDataManager.shared.fetchMemos()
        tableView.reloadData()
    }
    
    @objc func addMemo() {
        showMemoAlert(title: "새 메모", message: "메모 내용을 입력하세요")
    }
    
    private func showMemoAlert(title: String, message: String, index: Int? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addTextField { textField in
            if let index = index {
                textField.text = self.memoList[index].content
            }
        }
        
        let saveAction = UIAlertAction(title: index == nil ? "추가" : "수정" , style: .default) { [weak self] _ in
            guard let self = self, let text = alert.textFields?.first?.text, !text.isEmpty else { return }
            
            if let index = index {
                let memo = memoList[index]
                CoreDataManager.shared.updateMemo(memo: memo, newContent: text)
            } else {
                CoreDataManager.shared.createMemo(content: text)
            }
            
            self.fetchMemos()
        }
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }

}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = memoList[indexPath.row].content
        
        return cell
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        showMemoAlert(title: "메모 수정", message: "메모 내용을 수정하세요.", index: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let memo = memoList[indexPath.row]
            CoreDataManager.shared.deleteMemo(memo: memo)
            fetchMemos()
        }
    }
}
