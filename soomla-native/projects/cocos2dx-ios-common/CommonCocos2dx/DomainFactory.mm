//
// Created by Fedor Shubin on 6/10/14.
//

#import "DomainFactory.h"
#import "CommonJsonConsts.h"


@interface DomainFactory ()
@property(nonatomic, retain) NSMutableDictionary *creators;
@end

@implementation DomainFactory

+ (id)sharedDomainFactory {
    static DomainFactory *sharedDomainFactory = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedDomainFactory = [[self alloc] init];
    });
    return sharedDomainFactory;
}

- (id)init {
    if (self = [super init]) {
        self.creators = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)dealloc {
    // Should never be called, but just here for clarity really.
    [_creators release];
}

- (void)registerCreatorForKey:(NSString *)key withBlock:(id (^)(NSDictionary *dict))creator {
    [_creators setValue:creator forKey:key];
}

- (id)createWithDict:(NSDictionary *)dict {
    NSString* type = [dict objectForKey:JSON_JSON_TYPE];
    id (^creator)(NSDictionary *)  = [_creators valueForKey:type];
    return creator(dict);
}


@end