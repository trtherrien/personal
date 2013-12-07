//
//  ViewController.m
//  DBTest
//
//  Created by Thomas Therrien on 8/25/13.
//  Copyright (c) 2013 Tom Therrien. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "ViewController.h"

@interface ViewController () {
    sqlite3 *contactDB;
    NSString *databasePath;
}
@property (weak, nonatomic) IBOutlet UITextField *nameText;
@property (weak, nonatomic) IBOutlet UITextField *addressText;
@property (weak, nonatomic) IBOutlet UITextField *phoneText;
- (IBAction)addClick:(id)sender;
- (IBAction)listClick:(id)sender;

@end

@implementation ViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *docsDir;
    NSArray *dirPaths;
    
    // Get the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = [dirPaths objectAtIndex:0];
    
    // Build the path to the database file
    databasePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent: @"contacts.db"]];
    
    NSFileManager *filemgr = [NSFileManager defaultManager];
    
    if ([filemgr fileExistsAtPath: databasePath ] == NO) {
        const char *dbpath = [databasePath UTF8String];
        
        if (sqlite3_open(dbpath, &contactDB) == SQLITE_OK) {
            char *errMsg;
            const char *sql_stmt = "CREATE TABLE IF NOT EXISTS CONTACTS (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT, ADDRESS TEXT, PHONE TEXT)";
            
            if (sqlite3_exec(contactDB, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK) {
                NSLog(@"Failed to create table");
            }
            sqlite3_close(contactDB);
        }
        else {
            NSLog(@"Failed to open/create database");
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addClick:(id)sender {
    NSString *insertStatement = [NSString stringWithFormat:@"INSERT INTO CONTACTS (NAME, ADDRESS, PHONE) VALUES ('%@', '%@', '%@')", self.nameText.text, self.addressText.text, self.phoneText.text];
    NSLog(@"%@",insertStatement);
    const char *dbpath = [databasePath UTF8String];
    
    if (sqlite3_open(dbpath, &contactDB) == SQLITE_OK) {
        char *errMsg;
        const char *sql_stmt = [insertStatement UTF8String];
        
        if (sqlite3_exec(contactDB, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK) {
            NSLog(@"Failed to add record");
            NSLog(@"%s",errMsg);
        }
        sqlite3_close(contactDB);
    }
    else {
        NSLog(@"Failed to open/create database");
    }
    
}

- (IBAction)listClick:(id)sender {
    const char *dbpath = [databasePath UTF8String];
    sqlite3_stmt    *statement;
    if (sqlite3_open(dbpath, &contactDB) == SQLITE_OK) {
        
        NSString *querySQL = [NSString stringWithFormat: @"SELECT * FROM CONTACTS"];
        
        const char *query_stmt = [querySQL UTF8String];
        
        if (sqlite3_prepare_v2(contactDB, query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            while (sqlite3_step(statement) == SQLITE_ROW) 
            {
                NSString *nameField = [[NSString alloc] initWithUTF8String:(const char*) sqlite3_column_text(statement, 1)];
                NSString *addressField = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                
                NSString *phoneField = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                NSLog(@"%@, %@, %@", nameField, addressField, phoneField);
            }
            sqlite3_finalize(statement);
        }
        sqlite3_close(contactDB);
    }
    
}
@end
