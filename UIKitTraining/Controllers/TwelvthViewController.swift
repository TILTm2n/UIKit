//
//  TwelvthViewController.swift
//  UIKitTraining
//
//  Created by Eugene on 08.01.2022.
//

import UIKit

class TwelvthViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var myTableView = UITableView()
    let identifier = "MyCell"
    var array = ["1","2","3","4","5","6","7","8","9"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Twelve VC"
        self.view.backgroundColor = .systemBlue
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editableTable))
        
        createTable()
        
        
    }
    
    @objc func editableTable(){
        myTableView.isEditing = !myTableView.isEditing
    }
    
    func createTable(){
        myTableView = UITableView(frame: view.bounds, style: .plain)
        //присваивание ячейке идентифификатора через register
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        
        myTableView.delegate = self
        myTableView.dataSource = self
        
        //автоматическое изменение расположения(layout) при изменении frame у SuperView
        myTableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        view.addSubview(myTableView)
    }
    
    // MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        var contentCell = cell.defaultContentConfiguration()
        contentCell.text = "\(indexPath.row)"
        contentCell.secondaryText = "\(indexPath.section)"
        cell.contentConfiguration = contentCell
        cell.accessoryType = .detailButton
        
        switch indexPath.section{
        case 0:
            cell.backgroundColor = .red
        case 1:
            cell.backgroundColor = .blue
        case 2:
            cell.backgroundColor = .orange
        default:
            break
        }
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    //задает дествия при нажатия на accessoryButton
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        print("Accessory path", indexPath)
    }
    
    //определяет какая иконка будет при смахивании
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    //запрашивает у источника данных подтверждение вставки или удаления
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            self.array.remove(at: indexPath.row)
            
            //использовать при собственной вставке
            //tableView.deleteRows(at: [indexPath], with: .left)
            tableView.reloadData()
            
        }
    }
    
    //разрешает перемещать строки
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //перемещает строки
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = array[sourceIndexPath.row]
        array.remove(at: sourceIndexPath.row)
        array.insert(item, at: destinationIndexPath.row)
    }
}
