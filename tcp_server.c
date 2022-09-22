#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <sys/socket.h>
#include <arpa/inet.h>

#define TCP_PORT 5100 /* 서버의 포트 번호 */

int main(int argc, char **argv)
{
    int ssock, csock; /* 소켓의 디스크립트 정의 */
    socklen_t clen;
    int n;
    struct sockaddr_in servaddr, cliaddr; /* 주소 구조체 정의 */
    char mesg[BUFSIZ];

    /* 서버 소켓 생성 */
    //ssock이 -1 받으면 에러 3 받으면... 뭐?
    if ((ssock = socket(AF_INET, SOCK_STREAM, 0)) < 0) //AF_INET 인터넷임. 이거만 씀, TCP 옵션이라 SOCK_STREAM임. UDP는 다름
    {
        perror("socket()");
        return -1; //0은 정상 0이 아니면 에러.
    }
    //?? 무슨 기능이라고?? 서버 바로 다시 켜는 기능?
    int option = 1;
    setsockopt(ssock, SOL_SOCKET, SO_REUSEADDR, &option, sizeof(option)); //SO_REUSEADDR 해당 주소를 재사용할 거다

    /* 주소 구조체에 주소 저장*/
    memset(&servaddr, 0, sizeof(servaddr));
    servaddr.sin_family = AF_INET; //일단 p.346부터 읽어보자. 구조체 값은 바뀌는 경우가 많지 않다고 함.
    servaddr.sin_addr.s_addr = htonl(INADDR_ANY); //all local ip를 할당하겠다.
    servaddr.sin_port = htons(TCP_PORT); /* 사용할 포트 지정 */

    /* bind 함수를 사용하여 서버 소켓의 주소 설정 */
    if(bind(ssock, (struct sockaddr *)&servaddr, sizeof(servaddr)) < 0)
    {
        perror("bind()");
        return -1;
    }

    /*동시에 접속하는 클라이언트의 처리를 위한 대기 큐를 설정*/
    if(listen(ssock, 8) < 0) //8개까지 처리하기 위해서 buffer를 만들 거야.라는 의미.
    {
        perror("listen()");
        return -1;
    }

    clen = sizeof(cliaddr);
    #if 1
    do {
        /*클라이언트가 접속하면 접속을 허용하고, 클라이언트 소켓 생성*/
        csock = accept(ssock, (struct sockaddr *)&cliaddr, &clen); //client가 connect할 때까지 대기함

        /*네트워크 주소를 문자열로 변경 */
        inet_ntop(AF_INET, &cliaddr.sin_addr, mesg, BUFSIZ);
        printf("Client is connected : %s\n", mesg);

        if((n = read(csock, mesg, BUFSIZ)) <= 0)
        {
            perror("read()");
        }

        printf("Received data : %s\n", mesg);

        /* 클라이언트로 buf에 있는 문자열 전송 */
        if(write(csock, mesg, n) <= 0)
        {
            perror("write()");
        }

        close(csock); /* 클라이언트 소켓을 닫음 */
    } while(strncmp(mesg, "q", 1));

    #else
    while((csock = accept(ssock, (struct sockaddr *)&cliaddr, &clen)) > 0) //client가 connect할 때까지 대기함)
    {
        if(csock < 0)
        {
            perror("accept() error\n");
            return -1;
        }
        
        /*네트워크 주소를 문자열로 변경 */
        inet_ntop(AF_INET, &cliaddr.sin_addr, mesg, BUFSIZ);
        printf("Client is connected : %s\n", mesg);

        if((n = read(csock, mesg, BUFSIZ)) <= 0)
        {
            perror("read()");
        }

        printf("Received data : %s\n", mesg);

        /* 클라이언트로 buf에 있는 문자열 전송 */
        if(write(csock, mesg, n) <= 0)
        {
            perror("write()");
        }

        close(csock); /* 클라이언트 소켓을 닫음 */
    }
    #endif
    


    close(ssock); /* 서버 소켓을 닫음 */

    return 0;
}