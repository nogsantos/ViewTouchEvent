//
//  ViewController.m
//  ViewTouchEventEx1
//
//  Created by Fabricio Nogueira dos Santos on 9/15/15.
//  Copyright (c) 2015 Fabricio Nogueira. All rights reserved.
//

#import "ViewController.h"
#import "CirculoViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/**
 * Inicialização do método na view.
 */
-(void)loadView{
    CirculoViewController *c = [[CirculoViewController alloc]init];
    c.backgroundColor        = [UIColor whiteColor];
    self.view                = c;
}

@end
