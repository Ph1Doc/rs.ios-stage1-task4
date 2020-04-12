#import "SquareDecomposer.h"

@implementation SquareDecomposer
- (NSArray <NSNumber*>*)decomposeNumber:(NSNumber*)number {

    if ([number doubleValue] < 5) {
        return nil;
    } else {
        NSMutableArray *result = [[NSMutableArray alloc] initWithArray:[SquareDecomposer findSquaresFor:number with:[number doubleValue] * [number doubleValue]]];
        [result removeLastObject];
        return result;
    }
    // good luck
}

+(NSArray <NSNumber*>*)findSquaresFor:(NSNumber*)number with:(NSInteger)square{

    long i = [number longLongValue];

    if (square == 0) {
        return [[NSArray alloc] initWithObjects:number, nil];
    }

    for (long j = i - 1; j > 0; j-- ){
        if (square - j*j >= 0) {
            NSMutableArray *squares = [[NSMutableArray alloc] initWithArray:[SquareDecomposer findSquaresFor:[NSNumber numberWithDouble:j] with:(square - j*j)]];
            if ([squares count] != 0) {
                [squares addObject:number];
                return squares;
            }
        }

    }
    return @[];
}
@end
