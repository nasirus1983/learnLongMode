#include "tools.h"

int custom_len(const char* container){
    int len = 0;
    while (container[len] != '\0')
        len++;
    return len;
}
