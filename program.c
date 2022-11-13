#include "stdlib.h"
#include "stdio.h"

struct buffer {
    size_t len;
    char* data;
};

char* myreadfile(FILE* f) {
    fseek(f, 0, SEEK_END);
    size_t len = ftell(f) + 1;
    fseek(f, 0, SEEK_SET);
    char* line = (char*)malloc(len);
    fread(line, 1, len - 1, f);
    line[len - 1] = 0;
    return line;
}

void mywritefile(char* line) {
    char* list = "bcdfghjklmnprstvwxyz";
    size_t i = 0;
    char c = line[0];
    while (c != 0) {
        int flag = 0;
        for (int j = 0; j < 20; ++j) {
            if (c == list[j]) {
                flag = 1;
                break;
            }
        }
        if (flag) {
            printf("%d", c);
        } else {
            printf("%c", c);
        }
        i++;
        c = line[i];
    }
}

int main(int argc, char* argv[]) {
    if (argc == 2) {
        FILE* f;
        if ((f = fopen(argv[1], "r")) == NULL) {
            printf("no such file\n");
            return 1;
        }
        mywritefile(myreadfile(f));
        return 0;
    } else {
        printf("add path as argument\n");
    }
}
