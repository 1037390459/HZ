

#import "MBProgressHUD.h"

@interface MBProgressHUD (KR)

typedef void(^CallBack)(void);

+ (void)showSuccess:(NSString *)success toView:(UIView *)view;
+ (void)showError:(NSString *)error toView:(UIView *)view;

+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view;


+ (void)showSuccess:(NSString *)success;
+ (void)showError:(NSString *)error;

+ (MBProgressHUD *)showMessage:(NSString *)message;
+ (MBProgressHUD *)showWarning:(NSString *)message;
+ (MBProgressHUD *)showWarning:(NSString *)message toView:(UIView *)view;
+ (void)hideHUDForView:(UIView *)view;
+ (void)hideHUD;
@end
