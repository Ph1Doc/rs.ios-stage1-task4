#import "FullBinaryTrees.h"

@interface Node : NSObject

@property (nonatomic, strong) Node *left;
@property (nonatomic, strong) Node *right;

@end

@implementation Node

@end

@implementation FullBinaryTrees
- (NSString *)stringForNodeCount:(NSInteger)count {

    NSArray *array = [FullBinaryTrees createArrayOfNodesWith:count];
    if (count == 1) {
        return @"[[0]]";
    } else {
        NSMutableString *binaryTrees = [NSMutableString stringWithString:@"["];
        for (Node *node in array) {
            int number = 1;
            int nodesCount = 0;
            NSMutableString *string = [NSMutableString stringWithString:@"[0,"];
            NSMutableArray *nodes = [NSMutableArray arrayWithObject:node];

            for (NSInteger i = nodesCount; i < count; i++) {
                Node *nodeNow = [nodes firstObject];
                [nodes removeObjectAtIndex:0];
                if (nodeNow.left && nodeNow.right) {
                    [string appendString:@"0,0,"];
                    [nodes addObject:nodeNow.left];
                    [nodes addObject:nodeNow.right];
                    number += 2;
                } else {
                    if (number < count) {
                        [string appendString:@"null,null,"];
                    }
                }
            }

            NSInteger location = string.length - 1;
            [string deleteCharactersInRange:NSMakeRange(location, 1)];
            Node *lastObj = nodes.lastObject;
            if ([node isEqual:lastObj]) {
                [string appendString:@"]"];
            }else {
                [string appendString:@"],"];
            }
            [binaryTrees appendString:string];
        }

        [binaryTrees appendString:@"]"];
        return binaryTrees;
    }

    // good luck
}

+ (NSArray *)createArrayOfNodesWith:(NSInteger)count {
    NSMutableArray *array = [NSMutableArray new];
    if (count % 2 == 0) {
        return array;
    }
    if (count == 1) {
        Node *currentNode = [Node new];
        [array addObject:currentNode];
        return array;
    }
    for (int i = 1; i < count;) {
        for (Node *left in [self createArrayOfNodesWith:i]) {
            for (Node *right in [self createArrayOfNodesWith:count - i - 1]) {
                Node *root = [Node new];
                root.left = left;
                root.right = right;
                [array addObject:root];
            }
        }
        i += 2;
    }
    return array;
}



@end
