//
//  HDemosVc.m
//  OpenGLESShader
//
//  Created by huangshiping on 2017/6/27.
//  Copyright © 2017年 huangshiping. All rights reserved.
//

#import "HDemosVc.h"
#import "WaterWaveEffectVc.h"
#import "FlameVc.h"


@interface HDemosVc ()
{
    NSMutableArray *demoArrays;
}
@end

@implementation HDemosVc

- (void)viewDidLoad
{
    [super viewDidLoad];
    demoArrays = [NSMutableArray new];
    
    NSString* demo1 = @"水波纹效果";
    NSString* demo2 = @"火焰效果";
    [demoArrays addObject:demo1];
    [demoArrays addObject:demo2];
    
}

#pragma mark -------TableViewController-------

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [demoArrays count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellTableIdentifier = @"CellTableIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             CellTableIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:CellTableIdentifier];
    }
    
    cell.textLabel.text = [demoArrays objectAtIndex:indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController* viewC;
    switch (indexPath.row)
    {
        case 0:
        {
            viewC = [WaterWaveEffectVc new];
            
            break;
        }
        case 1:
        {
            viewC = [FlameVc new];
            break;
        }
        case 2:
        {
            
            break;
        }
            
        default:
            break;
    }
    [self presentViewController:viewC animated:NO completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}@end
