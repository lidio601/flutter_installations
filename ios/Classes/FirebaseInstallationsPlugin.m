#import "FirebaseInstallationsPlugin.h"

#import "FirebaseInstallations.h"

@implementation FirebaseInstallationsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"firebase_installations"
            binaryMessenger:[registrar messenger]];
  FirebaseInstallationsPlugin* instance = [[FirebaseInstallationsPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getId" isEqualToString:call.method]) {
    [[FIRInstallations installations] installationIDWithCompletion:^(NSString *identifier, NSError *error) {
      if (error != nil) {
        NSLog(@"Error fetching Installation ID %@", error);
        result([FlutterError errorWithCode:@"error"
                                   message:error.description
                                   details:nil]);
        return;
      }

      if (identifier == nil) {
        NSLog(@"Empty Installation ID %@", error);
          result([FlutterError errorWithCode:@"empty"
                                     message:@"Empty installation ID"
                                     details:nil]);
        return;
      }

      NSLog(@"Installation ID: %@", identifier);
      result(identifier);
    }];
  } else if ([@"delete" isEqualToString:call.method]) {
    [[FIRInstallations installations] deleteWithCompletion:^(NSError *error) {
      if (error != nil) {
        NSLog(@"Error deleting Installation %@", error);
        result([FlutterError errorWithCode:@"error"
                                   message:error.description
                                   details:nil]);
        return;
      }

      NSLog(@"Installation deleted");
      result(@(TRUE));
    }];
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
