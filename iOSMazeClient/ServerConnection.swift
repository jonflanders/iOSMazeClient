//
//  OpenXServerConnection.swift
//  OpenXSDKCore
//
//  Created by Jon Flanders on 8/22/14.
//  Copyright (c) 2014 OpenX. All rights reserved.
//

import Foundation

public typealias ServerCallback = (NSXMLParser?,NSError?)->(Void)

public class ServerConnection {
    let maxOp = 100;
    public init()
    {
        self.queue = NSOperationQueue()
        self.queue.maxConcurrentOperationCount = maxOp
        self.configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
    }
    private let queue:NSOperationQueue
    private let configuration:NSURLSessionConfiguration
    public func get(resourceURL: String, callback: ServerCallback) {
        
        let url = NSURL(string: resourceURL)
        let request = NSMutableURLRequest(URL: url)
        let session = self.getSession()
        let task = session.dataTaskWithRequest(request) { (data , response ,  err) -> Void in
          
            if(err != nil){
                
               callback(nil,err)
                
            }else
            {
                let (xml,e) = self.xmlFromData(data)
                if(e != nil){
                    
                    callback(nil,e.memory)
                    
                }else
                {
                    callback(xml,nil)
                }
            }
        }
        task.resume()
        
    }
    private func xmlFromData(data:NSData)->(NSXMLParser?,NSErrorPointer){
        var err:NSErrorPointer = nil
        var ret:NSXMLParser?  = nil
        return (ret,err)
    }
    private func getSession()->NSURLSession{
        let ret = NSURLSession(configuration: configuration)
        return ret
    }
}