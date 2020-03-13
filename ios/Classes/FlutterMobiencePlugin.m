#import "FlutterMobiencePlugin.h"
#if __has_include(<flutter_mobience/flutter_mobience-Swift.h>)
#import <flutter_mobience/flutter_mobience-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_mobience-Swift.h"
#endif

@implementation FlutterMobiencePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterMobiencePlugin registerWithRegistrar:registrar];
}
@end
