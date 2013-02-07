#include <cstdlib>
#include <iostream>
#include <windows.h>

using namespace std;

int main(int argc, char *argv[])
{
	OSVERSIONINFO	vi;
	memset (&vi, 0, sizeof vi);
	vi .dwOSVersionInfoSize = sizeof vi;
	GetVersionEx (&vi);
	if (vi.dwMajorVersion==5) 
	{
		cout<<"Not Windows 7"<<endl;
	}
	system("PAUSE");
    return EXIT_SUCCESS;
}
