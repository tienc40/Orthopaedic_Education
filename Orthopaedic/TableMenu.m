//
//  TableMenu.m
//  Orthopaedic
//
//  Created by Kiennd on 11/17/13.
//  Copyright (c) 2013 TienT. All rights reserved.
//

#import "TableMenu.h"

#define HEIGHT_ROW_MENU 40
@implementation TableMenu
{
    NSArray *_menuContent;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _menuContent = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"menu" ofType:@"plist"]];
        
        _categoryMenu = [[UITableView alloc] initWithFrame:self.frame];
        _categoryMenu.dataSource = self;
        _categoryMenu.delegate = self;
        [self addSubview:_categoryMenu];
    }
    return self;
}

#pragma mark uitableview delegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"%d",_menuContent.count);
    return [_menuContent count];
    //    return 5;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return HEIGHT_ROW_MENU;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"");
    static NSString *simpleTableIdentifier = @"CategoryTableItem"; //cho no chuan chut nhe CategoryTableItem, do bi nham
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }

    NSDictionary* rowInfo = [_menuContent objectAtIndex:indexPath.row];
    cell.textLabel.text = [rowInfo objectForKey:@"name"];
    cell.imageView.image = [UIImage imageNamed:[rowInfo objectForKey:@"image"]];
    return cell;
}


//-(void) tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)newIndexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:newIndexPath];
    
    NSString *cellText = cell.textLabel.text;
    NSLog(@"%@",cellText);
    [_menuDelegate didSelectItem:newIndexPath.row];
    [tableView deselectRowAtIndexPath:newIndexPath animated:YES];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
