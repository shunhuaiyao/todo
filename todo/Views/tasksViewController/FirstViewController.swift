//
//  FirstViewController.swift
//  todo
//
//  Created by Yao Shun-Huai on 2019/6/9.
//  Copyright © 2019 Yao Shun-Huai. All rights reserved.
//

import UIKit
import JTAppleCalendar

class FirstViewController: UIViewController {

    var numberOfRows = 6
    var currentSelectedDate: Date?
    @IBOutlet weak var monthYearLabel: UILabel!
    @IBOutlet weak var calendarView: JTAppleCalendarView!
    @IBOutlet weak var calendarHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var weekMonthToggleButton: UIButton!
    @IBOutlet weak var todoTasksTableView: UITableView!
    var taskIndexPathToEdit: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.monthYearLabel.font = UIFont(name: Theme.mainFontName, size: 17)
        self.todoTasksTableView.dataSource = self
        self.todoTasksTableView.delegate = self
        dayFunctions.readDays(completion: { [unowned self] in
            self.todoTasksTableView.reloadData()
        })
    }
    
    
    func configureCell(view: JTAppleCell?, cellState: CellState) {
        guard let cell = view as? DateCell  else { return }
        cell.dateLabel.text = cellState.text
        cell.dateLabel.font = UIFont(name: Theme.mainFontName, size: 17)
        handleCellTextColor(cell: cell, cellState: cellState)
        handleCellSelected(cell: cell, cellState: cellState)
        handleMonthYearState(cell: cell, cellState: cellState)
    }
    
    func handleCellTextColor(cell: DateCell, cellState: CellState) {
        if cellState.dateBelongsTo == .thisMonth {
            cell.dateLabel.textColor = UIColor.black
        } else {
            cell.dateLabel.textColor = UIColor.gray
        }
    }
    
    func handleCellSelected(cell: DateCell, cellState: CellState) {
        if cellState.isSelected {
            cell.selectedView.layer.cornerRadius = cell.selectedView.frame.size.width / 2
            cell.selectedView.isHidden = false
        } else {
            cell.selectedView.isHidden = true
        }
    }
    
    func handleMonthYearState(cell: DateCell, cellState: CellState) {
        let month = cellState.dateSection().month
        switch month {
        case 1:
            monthYearLabel.text = "January"
        case 2:
            monthYearLabel.text = "February"
        case 3:
            monthYearLabel.text = "March"
        case 4:
            monthYearLabel.text = "April"
        case 5:
            monthYearLabel.text = "May"
        case 6:
            monthYearLabel.text = "June"
        case 7:
            monthYearLabel.text = "July"
        case 8:
            monthYearLabel.text = "August"
        case 9:
            monthYearLabel.text = "September"
        case 10:
            monthYearLabel.text = "October"
        case 11:
            monthYearLabel.text = "November"
        default:
            monthYearLabel.text = "December"
        }
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        let yearString = formatter.string(from: cellState.dateSection().range.end)
        monthYearLabel.text = monthYearLabel.text! + " " + yearString
    }
    @IBAction func weekMonthToggleButton(_ sender: UIButton) {
        if self.currentSelectedDate == nil {
            self.currentSelectedDate = Date()
        }
        UIView.animate(withDuration: 0.2, animations: {
            if self.numberOfRows == 6 {
                self.numberOfRows = 1
                self.calendarHeightConstraint.constant = 30
                self.weekMonthToggleButton.transform = self.weekMonthToggleButton.transform.rotated(by: CGFloat(Double.pi))
            }
            else {
                self.numberOfRows = 6
                self.calendarHeightConstraint.constant = 180
                self.weekMonthToggleButton.transform = self.weekMonthToggleButton.transform.rotated(by: CGFloat(Double.pi))
            }
            self.view.layoutIfNeeded()
            self.calendarView.reloadData(withanchor: self.currentSelectedDate)
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddTasksViewController" {
            let popup = segue.destination as! addTasksViewController
            popup.taskIndexPathToEdit = self.taskIndexPathToEdit
            popup.doneAddingTask = { [unowned self] in
                self.todoTasksTableView.reloadData()
            }
        }
    }
}

extension FirstViewController: JTAppleCalendarViewDataSource {
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy MM dd"
        let startDate = formatter.date(from: "2019 06 01")!
        let endDate = formatter.date(from: "2019 07 31")!
        if numberOfRows == 6 {
            return ConfigurationParameters(startDate: startDate, endDate: endDate, numberOfRows: numberOfRows)
        } else {
            return ConfigurationParameters(startDate: startDate,
                                           endDate: endDate,
                                           numberOfRows: numberOfRows,
                                           generateInDates: .forFirstMonthOnly,
                                           generateOutDates: .off,
                                           hasStrictBoundaries: false)
        }
    }
}

extension FirstViewController: JTAppleCalendarViewDelegate {
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "dateCell", for: indexPath) as! DateCell
        self.calendar(calendar, willDisplay: cell, forItemAt: date, cellState: cellState, indexPath: indexPath)
        return cell
    }
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        configureCell(view: cell, cellState: cellState)
    }
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        configureCell(view: cell, cellState: cellState)
        self.currentSelectedDate = cellState.date
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        configureCell(view: cell, cellState: cellState)
    }
}

extension FirstViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return Data.dayModels.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Data.dayModels[section].dateString
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.dayModels[section].taskModels.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! tasksTableViewCell
        cell.setupCell(taskModel: Data.dayModels[indexPath.section].taskModels[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (contextualAction, view, actionPerformed: (Bool) -> ()) in
            let hasEmptyTask = dayFunctions.deleteTaskInExistedDay(indexPath: indexPath)
            if hasEmptyTask {
                tableView.deleteSections(IndexSet(arrayLiteral: indexPath.section), with: .left)
            } else {
                tableView.deleteRows(at: [indexPath], with: .left)
            }
            actionPerformed(true)
        }
        return UISwipeActionsConfiguration(actions: [delete])
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.taskIndexPathToEdit = indexPath
        self.performSegue(withIdentifier: "toAddTasksViewController", sender: nil)
    }
}
