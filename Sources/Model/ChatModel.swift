//
//  File.swift
//  
//
//  Created by 손창빈 on 2022/01/20.
//

import Foundation

struct ChatModel: Codable {
    var seq: Int
    var time: TimeInterval
    var body: String
    var messageByMe: Bool
    var myID: String?
    var myImageUrl: String?
    
    private enum ChatModelKeys: String, CodingKey {
        case seq
        case time
        case body
        case messageByMe
        case myID
        case myImageUrl
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: ChatModelKeys.self)
        seq = try values.decode(Int.self, forKey: .seq)
        time = try values.decode(TimeInterval.self, forKey: .time)
        body = try values.decode(String.self, forKey: .body)
        messageByMe = try values.decode(Bool.self, forKey: .messageByMe)
        myID = try? values.decode(String.self, forKey: .myID)
        myImageUrl = try? values.decode(String.self, forKey: .myImageUrl)
    }
    
    init?(dictionary: ([String: Any])) {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: dictionary as Any)
            self = try JSONDecoder().decode(ChatModel.self, from: jsonData)
        } catch let error as NSError {
            print("ChatModel Decode Error -> \(error.debugDescription)")
            return nil
        }
    }
}
