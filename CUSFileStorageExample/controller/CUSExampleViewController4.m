//
//  CUSExampleViewController4.m
//  CUSFileStorageExample
//
//  Created by zhangyu on 14-5-15.
//  Copyright (c) 2014年 zhangyu. All rights reserved.
//

#import "CUSExampleViewController4.h"

@implementation CUSExampleViewController4

-(NSString *)getDBName{
    return @"TestDB4";
}

-(id)doCreateItem:(NSInteger)index{
    return [CUSModelFactory createTeacher:index];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CUSFileStorage *storage = [CUSFileStorageManager getFileStorage:[self getDBName]];
    static NSString *CellIdentifier = @"CUS_CELL";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    
    NSString *rowKey = [self getKeyByIndex:indexPath.row];
    CUSTeacher *value = [storage objectForKey:rowKey];
    cell.textLabel.text = rowKey;
    cell.detailTextLabel.text = value.name;
    
    return cell;
}
@end
