//
//  File.swift
//  
//
//  Created by 손창빈 on 2022/01/20.
//

import Foundation
import UIKit

final class ChatTableViewModel<T> {
    
    private var tableView: UITableView!
    private var dataDic = [Int : T]()
    
    convenience init(tableView: UITableView) {
        self.init()
        
        self.tableView = tableView
    }
    
    deinit {
        
    }
}

extension ChatTableViewModel {
    func bindDataSource(items: [T]) {
    }
}
/*
// MARK: - TableView Delegate
extension ChatTableViewModel: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let item = self.list[indexPath.row]
        
        // 공지사항, 공지글은 기능 없다.
        if isNoticeExist(), indexPath.section == .zero { return nil }
        if item.isRefreshCell { return nil }
        if item.isNotice { return nil }
        
        let reportAction = UIContextualAction(style: .normal, title: nil, handler: { [weak self] (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            self?.reportAction(item.liveSeq)
            success(true)
        })
        reportAction.backgroundColor = .white

        if #available(iOS 13.0, *) {
            reportAction.image = UIImage(named: "LiveReportBtn")
        } else {
            if let cgImageEdit =  UIImage(named: "LiveReportBtn")?.cgImage {
                reportAction.image = ImageWithoutRender(cgImage: cgImageEdit, scale: UIScreen.main.nativeScale, orientation: .up)
            }
        }
        
        let replyAction = UIContextualAction(style: .normal, title: nil, handler: { [weak self] (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            self?.replyAction(item)
            success(true)
        })
        replyAction.backgroundColor = .white
        
        if #available(iOS 13.0, *) {
            replyAction.image = UIImage(named: "LiveReplyBtn")
        } else {
            if let cgImageEdit =  UIImage(named: "LiveReplyBtn")?.cgImage {
                replyAction.image = ImageWithoutRender(cgImage: cgImageEdit, scale: UIScreen.main.nativeScale, orientation: .up)
            }
        }

        let deleteAction = UIContextualAction(style: .normal, title: nil, handler: { [weak self] (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            self?.deleteAction(item.liveSeq)
            success(true)
        })
        deleteAction.backgroundColor = .white
        
        if #available(iOS 13.0, *) {
            deleteAction.image = UIImage(named: "LiveDeleteBtn")
        } else {
            if let cgImageEdit =  UIImage(named: "LiveDeleteBtn")?.cgImage {
                deleteAction.image = ImageWithoutRender(cgImage: cgImageEdit, scale: UIScreen.main.nativeScale, orientation: .up)
            }
        }
        
        let configuration = UISwipeActionsConfiguration(actions: item.isMine ? [deleteAction, replyAction] : [reportAction, replyAction])
        configuration.performsFirstActionWithFullSwipe = false
        return configuration
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 공지 글의 경우 section 0
        if isNoticeExist(), indexPath.section == .zero {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LiveNoticeTopTableViewCell", for: indexPath) as! LiveNoticeTopTableViewCell
            cell.configuration(self.channelViewModel)
            return cell
        }
        
        let item = self.list[indexPath.row]
        
        //먼저 관리자 글 인지 체크..
        if item.isNotice {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LiveNoticeTableViewCell", for: indexPath) as! LiveNoticeTableViewCell
            cell.configuration(item)
            return cell
        }
        
        if item.isRefreshCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LiveFooterTableViewCell", for: indexPath) as! LiveFooterTableViewCell
            cell.refreshButton.tag = RefreshType.refresh.rawValue
            cell.refreshButton.addTarget(self, action: #selector(refreshAction(_:)), for: .touchUpInside)
            return cell
        }
        
        if item.refLiveSeq != nil {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LiveReplyTableViewCell", for: indexPath) as! LiveReplyTableViewCell
            cell.configuration(item)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LiveTableViewCell", for: indexPath) as! LiveTableViewCell
            cell.configuration(item)
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return isNoticeExist() ? 2 : 1
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
}
*/
