#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];  // Manual memory management

    char operator;
    double num1, num2, result;

    // Prompt the user for the first number
    NSLog(@"Enter first number: ");
    scanf("%lf", &num1);  // Read the first number

    // Prompt the user for the operator
    NSLog(@"Enter an operator (+, -, *, /): ");
    scanf(" %c", &operator);  // Read the operator

    // Prompt the user for the second number
    NSLog(@"Enter second number: ");
    scanf("%lf", &num2);  // Read the second number

    // Perform the calculation based on the operator
    switch (operator) {
        case '+':
            result = num1 + num2;
            NSLog(@"Result: %lf", result);
            break;
        case '-':
            result = num1 - num2;
            NSLog(@"Result: %lf", result);
            break;
        case '*':
            result = num1 * num2;
            NSLog(@"Result: %lf", result);
            break;
        case '/':
            if (num2 != 0) {
                result = num1 / num2;
                NSLog(@"Result: %lf", result);
            } else {
                NSLog(@"Error: Division by zero!");
            }
            break;
        default:
            NSLog(@"Error: Invalid operator!");
            break;
    }

    [pool drain];  // Manually drain the autorelease pool
    return 0;
}
