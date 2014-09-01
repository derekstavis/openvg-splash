#include <errno.h>
#include <limits.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include "shapes.h"

void drawJPG(char* path, int width, int height);

int main(int argc, char** argv) {
    int width, height;
    char imagepath[PATH_MAX] = {0};
    char *image = argv[1];
    
    init(&width, &height);

    drawJPG(image, width, height);

    while (fgets(imagepath, PATH_MAX-1, stdin) != NULL) {
        char *clean_path = strtok(imagepath, "\n");
        char absolute_path[PATH_MAX] = {0};
		
		if (realpath(clean_path, absolute_path) != NULL) {
        	drawJPG(absolute_path, width, height);
    	} else {
			printf("%s\n", strerror(errno));
			exit(errno);
		}
	}

    finish();
    exit(0);
}

void drawJPG(char* path, int width, int height) {
    Start(width, height);
	Background(0, 0, 0);
    Image(0, 0, width, height, path);
    End();
}
