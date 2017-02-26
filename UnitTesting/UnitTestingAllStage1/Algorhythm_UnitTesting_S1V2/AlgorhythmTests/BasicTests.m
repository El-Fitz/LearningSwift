//
//  BasicTests.m
//  Algorhythm
//
//  Created by Gabe Nadel on 8/18/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Playlist.h"

@interface BasicTests : XCTestCase
@property (nonatomic) Playlist *playlist;
@property (nonatomic) NSDictionary *colorDictionary;
@property (nonatomic) UIColor *expectedColor;

@end

@implementation BasicTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    self.playlist = [[Playlist alloc]init];
    
    self.colorDictionary = @{@"red":@255.0, @"green": @155.0, @"blue": @55.0, @"alpha": @1.0};
    
    self.expectedColor = [UIColor colorWithRed:255.0/255 green:155.0/255 blue:55.0/255 alpha:1];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    self.playlist = nil;
    self.colorDictionary = nil;
    self.expectedColor = nil;
    [super tearDown];
}

-(void)testColorIsExpectedColor{
    UIColor *resultColor = [self.playlist rgbColorFromDictionary: self.colorDictionary];
    
    XCTAssertEqualObjects(resultColor, self.expectedColor, @"resultColor does NOT equal expectedColor");
    
}


-(void)testMissingColorValue{
    self.colorDictionary = @{@"red": @255.0, @"blue": @155.0, @"alpha": @1.0};
    UIColor *resultColor = [self.playlist rgbColorFromDictionary:self.colorDictionary];
    
    XCTAssertNotNil(resultColor, @"resultColor is nil");
}



-(void)testNotNil{
    XCTAssertNotNil(self.playlist, @"self.playlist IS nil.");
}

-(void)testPlaylistArtistsEmpty{
    XCTAssert(self.playlist.playlistArtists.count > 0, @"There ARE artists in playlistArtists");
}



@end
