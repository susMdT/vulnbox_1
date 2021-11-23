//wtf is c
//source code in case we need to debug anything
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>
#include <string.h>
int main()
 {
    char input;
    setuid( 0 );   // you can set it at run time also
    char command[1000];
    system( "docker ps" );
    system( "echo What is the container id?" );
    scanf( "%s", &input );
   // system( "docker exec -it %s /bin/sh", input );
   // system( "docker exec -it ", strcat( input ), " /bin/sh" );
    strcat(command, "docker exec -it ");
    strcat(command, &input);
    strcat(command, " /bin/sh");
    system(command);
    return 0;
 }
