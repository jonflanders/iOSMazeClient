//
//  CellController.swift
//  iOSMazeClient
//
//  Created by Jon Flanders on 10/16/14.
//  Copyright (c) 2014 Flounderware. All rights reserved.
//

import Foundation


class CellController : NSObject,NSXMLParserDelegate{
    func getCell(url:String, callback:((Cell)->Void))->Void{
        let sc = ServerConnection()
        sc.get(url,{ xml,error in
            
        })
    }
    
}