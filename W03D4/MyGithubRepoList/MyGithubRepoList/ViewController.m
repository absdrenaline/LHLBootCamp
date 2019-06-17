////  ViewController.m
// Created: 2019-06-16
//


#import "ViewController.h"


typedef void (^DataTaskCompletionHandler)(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) ;
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *repoTableView;
@property (weak, nonatomic) IBOutlet UITextField *userHandleTextField;

@end

@implementation ViewController {
    NSMutableArray* repoList;
}

- (void)obtainGitRepoList:(NSString *)userHandle {
    NSString *urlString = [NSString stringWithFormat:@"https://api.github.com/users/%@/repos",userHandle];
    NSURL *url = [NSURL URLWithString:urlString]; // 1
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:url]; // 2
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration]; // 3
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration]; // 4
    
    DataTaskCompletionHandler dataTaskCompletionHandler =
    ^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) { // 1
            // Handle the error
            NSLog(@"error: %@", error.localizedDescription);
            return;
        }
        
        NSError *jsonError = nil;
        NSArray *repos = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError]; // 2
        
        if (jsonError) { // 3
            // Handle the error
            NSLog(@"jsonError: %@", jsonError.localizedDescription);
            return;
        }
        
        // If we reach this point, we have successfully retrieved the JSON from the API
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            // This will run on the main queue
            for (NSDictionary *repo in repos) { // 4
                
                NSString *repoName = repo[@"name"];
                NSLog(@"repo: %@", repoName);
                [self->repoList addObject:repoName];
            }
            [self.repoTableView reloadData];
        }];
        
    };
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest
                                                completionHandler:dataTaskCompletionHandler];
    
    [dataTask resume];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    repoList = [NSMutableArray new];
    
    NSString *userHandle = @"lighthouse-labs";
    self.userHandleTextField.text = userHandle;
    
}

- (IBAction)getRepoList:(id)sender {
    if(self.userHandleTextField.text.length > 0) {
        [self obtainGitRepoList:self.userHandleTextField.text];
        [repoList removeAllObjects];
        [self.repoTableView reloadData];
    }
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RepoNameCell"];
    cell.textLabel.text = repoList[indexPath.row];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return repoList.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [NSString stringWithFormat:@"Total: %lu repos",repoList.count];
}


@end
