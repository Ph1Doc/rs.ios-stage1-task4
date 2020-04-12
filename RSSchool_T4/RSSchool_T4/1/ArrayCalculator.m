#import "ArrayCalculator.h"

@implementation ArrayCalculator
+ (NSInteger)maxProductOf:(NSInteger)numberOfItems itemsFromArray:(NSArray *)array {


    NSInteger sum = 1;

    NSArray *sortedArray = [ArrayCalculator sort:array];
    NSMutableArray *newArray =  [[NSMutableArray alloc] init];
    for (int i = 0; i < [sortedArray count]; i++) {
        NSNumber *element = sortedArray[i];
        if (![element isKindOfClass:[NSString class]]) {
            [newArray addObject:element];
        }
    }

    NSUInteger countArray = [newArray count];

    if (countArray != 0) {

        if  (numberOfItems > countArray) {
            for (int i = 0; i < countArray; i++ ) {
                NSNumber *element = newArray[i];
                if ([element intValue] != 0) {
                    sum = sum * [element intValue];
                }
            }
        } else {
            int numberOfMinus = 0;
            for (int i =0; i < numberOfItems; i++) {
                NSNumber *element = newArray[i];
                if ([element intValue] < 0) {
                    numberOfMinus = numberOfMinus + 1;
                }
            }
            for (int i = 0; i < numberOfItems; i++) {
                NSNumber *element = newArray[i];
                if ([element intValue] < 0 && numberOfMinus > 1 ){
                    sum = sum * [element intValue];
                    numberOfMinus = numberOfMinus - 1;
                } else if (sum < 0 && numberOfMinus == 1) {
                    sum = sum * [element intValue];
                    numberOfMinus = numberOfMinus - 1;
                } else if (numberOfMinus == 0) {
                    sum = sum * [element intValue];
                } else {
                    numberOfMinus = numberOfMinus - 1;
                    numberOfItems = numberOfItems + 1;
                }
            }
        }
    }
    else {
        sum = 0;
    }
    // good luck
    return sum;
}

+ (NSArray*)sort:(NSArray*)array {
    NSArray *sortedArray = [array sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        NSNumber *first = obj1;
        NSNumber *second = obj2;
        if (abs([first intValue]) == abs([second intValue]) )
            return NSOrderedSame;
        else if (abs([first intValue]) > abs([second intValue]) )
            return NSOrderedAscending;
        else
            return NSOrderedDescending;
    }];
    return sortedArray;
}

@end
