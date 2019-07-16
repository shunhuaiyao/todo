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
    @IBOutlet weak var calendarView: JTACMonthView!
    @IBOutlet weak var calendarShadowView: UIView!
    @IBOutlet weak var calendarHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var calendarShadowHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var weekMonthToggleButton: UIButton!
    @IBOutlet weak var todoTasksTableView: UITableView!
    var taskIndexPathToEdit: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        self.monthYearLabel.font = UIFont(name: Theme.mainFontName, size: 17)
        self.todoTasksTableView.dataSource = self
        self.todoTasksTableView.delegate = self
        dayFunctions.readDays(completion: { [unowned self] in
            self.todoTasksTableView.reloadData()
        })
        self.calendarShadowView.layer.shadowColor = UIColor.darkGray.cgColor
        self.calendarShadowView.layer.shadowOpacity = 1
        self.calendarShadowView.layer.shadowOffset = CGSize.zero
    }
    
    
    func configureCell(view: JTACDayCell?, cellState: CellState) {
        guard let cell = view as? DateCell  else { return }
        cell.dateLabel.text = cellState.text
//        cell.dateLabel.font = UIFont(name: Theme.mainFontName, size: 17)
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
            cell.dateLabel.textColor = UIColor.white
            cell.selectedView.layer.cornerRadius = cell.selectedView.frame.size.height / 2
            cell.selectedView.isHidden = false
        } else {
            if cellState.dateBelongsTo == .thisMonth {
                cell.dateLabel.textColor = UIColor.black
            } else {
                cell.dateLabel.textColor = UIColor.gray
            }
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
                self.calendarHeightConstraint.constant = 35
                self.calendarShadowHeightConstraint.constant = 16
                self.weekMonthToggleButton.transform = self.weekMonthToggleButton.transform.rotated(by: CGFloat(Double.pi))
            }
            else {
                self.numberOfRows = 6
                self.calendarHeightConstraint.constant = 210
                self.calendarShadowHeightConstraint.constant = 191
                self.weekMonthToggleButton.transform = self.weekMonthToggleButton.transform.rotated(by: CGFloat(Double.pi))
            }
            self.view.layoutIfNeeded()
            self.calendarView.reloadData(withAnchor: self.currentSelectedDate)
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

