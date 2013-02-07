//Only need windows.h for now
#include <windows.h>

//Global Variables
//The ClassName is to tell the OS the name of the Window
LPSTR szClassName = "PracticeWindow";
HINSTANCE hInstance;

//The method the OS will call to inform the program of new events
LRESULT CALLBACK MyWndProc(HWND, UINT, WPARAM, LPARAM);

//This is main for a Windows app
int WINAPI WinMain(HINSTANCE hInst, HINSTANCE hPrevInstance, LPSTR szCmdLine, int iCmdShow)
{
	//create a variable for a Window
	WNDCLASS wnd;
   	MSG msg;
   	HWND hwnd;

	hInstance = hInst;
        
   	wnd.style = CS_HREDRAW | CS_VREDRAW; //we will explain this later
   	wnd.lpfnWndProc = MyWndProc;
   	wnd.cbClsExtra = 0;
   	wnd.cbWndExtra = 0;
   	wnd.hInstance = hInstance;
   	wnd.hIcon = LoadIcon(NULL, IDI_APPLICATION); //default icon
   	wnd.hCursor = LoadCursor(NULL, IDC_ARROW);   //default arrow mouse cursor
   	wnd.hbrBackground = (HBRUSH)(COLOR_BACKGROUND+1);
   	wnd.lpszMenuName = NULL;                     //no menu
   	wnd.lpszClassName = szClassName;

   if(!RegisterClass(&wnd))                     //register the WNDCLASS
   {
       MessageBox(NULL, "This Program Requires Windows NT", 
                        "Error", MB_OK);
       return 0;
   }

   hwnd = CreateWindow(szClassName,
                       "Window Title",
                       WS_OVERLAPPEDWINDOW, //basic window style
                       CW_USEDEFAULT,
                       CW_USEDEFAULT,       //set starting point to default value
                       CW_USEDEFAULT,
                       CW_USEDEFAULT,       //set all the dimensions to default value
                       NULL,                //no parent window
                       NULL,                //no menu
                       hInstance,
                       NULL);               //no parameters to pass
   ShowWindow(hwnd, iCmdShow);              //display the window on the screen
   UpdateWindow(hwnd);             //make sure the window is updated correctly

   while(GetMessage(&msg, NULL, 0, 0))      //message loop
   {
       TranslateMessage(&msg);
       DispatchMessage(&msg);
   }
   return msg.wParam;
}

LRESULT CALLBACK MyWndProc(HWND hwnd, UINT msg, WPARAM wParam, LPARAM lParam)
{
   switch(msg)
   {
       case WM_DESTROY:
           PostQuitMessage(0);
           return 0;
   }
   return DefWindowProc(hwnd, msg, wParam, lParam);
}
