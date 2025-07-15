#include <stdio.h>
#include <string.h>
void fn(char * str) {
	char t;
	int len = strlen(str);
	char* p1 = str;
	char* p2 = str +len -1;
	while(p1<p2) {
		if(*p1 >= 'A' && *p1<='Z') {
			*p1 = *p1 + ('a' - 'A');
		}else if(*p1 >= 'a' && *p1<='z') {
			*p1 = *p1 - ('a' - 'A');
		}
		t=*p1;
		*p1=*p2;
		*p2=t;
		p1++;
		p2--;
	}
}
int main() {
	char str[100] = "Soojebi";
	int len,i;
	fn(str);
	len = strlen(str);
	for(i=1;i<len;i+=2;) {
		printf("%c", str[i]);
	}
	return 0;
}