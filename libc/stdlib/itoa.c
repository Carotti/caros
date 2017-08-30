#include <stdlib.h>
#include <stdbool.h>

void reverse_string(char* str, int length)
{
    int start = 0;
    int end = length - 1;
    while (start < end) {
        char tmp = str[start];
        str[start++] = str[end];
        str[end--] = tmp;
    }
}

char* itoa(int value, char* str, int base)
{
    // Current index in the string
    int i = 0;

    bool is_negative = false;

    // Negative numbers are only considered in base 10
    if (value < 0 && base == 10) {
        is_negative = true;
        value = -value;
    }

    if (value == 0) {
        str[i++] = '0';
    } else {
        while(value != 0)
        {
            int rem = value % base;
            str[i++] = (rem > 9) ? (rem - 10) + 'a' : rem + '0'; // Hex digits
            value = value / base;
        }
    }

    if (is_negative) str[i++] = '-'; // Append minus sign for negative numbers

    reverse_string(str, i);

    str[i] = '\0'; // Append a NULL character to the string
    return str;
}
