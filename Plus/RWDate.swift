//
//  RWDate.swift
//  RWiPlus
//
//  Created by mynSoo on 2018/1/14.
//  Copyright © 2018年 mynSoo. All rights reserved.
//

import Foundation

let _instacne: RWDate = RWDate();

class RWDate {
    
    // cache
    fileprivate var formatterDict:Dictionary = Dictionary<String,DateFormatter>();
    fileprivate var formatterList:Array = Array<String>();
    var cacheMaxCount:Int = 2 // default

    fileprivate class func share() -> RWDate {
        return _instacne;
    }
    
    // 创建 formatter
    fileprivate func creatFormatter(format: String)  -> DateFormatter {

        let formatter = DateFormatter();
        formatter.dateFormat = format;
        
        // 在容器存放
        formatterDict[format] = formatter;
        formatterList.append(format);
        
        print(formatterDict,formatterList);
        return formatter;
    }
    
    // 释放 formatter cache
    
    public class func clearCaches() {
        _instacne.formatterDict.removeAll();
        _instacne.formatterList.removeAll();
    }
    
    fileprivate func dropFirstFormatter() {
        
        if let key = formatterList.first {
            formatterDict[key] = nil;
            formatterList.removeFirst();
        }
    }
    
    // 获取 formatter
    fileprivate func loadFormatter(format: String) -> DateFormatter {
        
        if let formatter = formatterDict[format] {
            
            return formatter;
        }else {
            // 判断是否超过清理
            if(formatterList.count >= cacheMaxCount) {
                
                self.dropFirstFormatter();
            }
            
            let formatter = creatFormatter(format: format);
            return formatter
        }
    }
    
    // 转换
    fileprivate func convertDateToString(toFormat: String, fromDate: Date) -> String? {
        
        let formatter = loadFormatter(format: toFormat);
        return formatter.string(from: fromDate);
    }
    
    fileprivate func convertStringToDate(toFormat: String, fromString: String) -> Date? {
        
        let formatter = loadFormatter(format: toFormat);
        return formatter.date(from: fromString);
    }
}

extension String {
    
    public func converToDate(toFormat: String) -> Date? {
        
        return _instacne.convertStringToDate(toFormat: toFormat, fromString: self);
    }
    
    public func convertToString(fromFormat: String, toFormat: String) -> String? {
        
        if let fromDate = _instacne.convertStringToDate(toFormat: fromFormat, fromString: self) {
            
            return _instacne.convertDateToString(toFormat: toFormat, fromDate: fromDate);
        }else {
            
            return nil;
        }
    }
}

extension Date {
    
    public func convertToString(toFormat: String) -> String? {
        
        return _instacne.convertDateToString(toFormat: toFormat, fromDate: self);
    }
}
