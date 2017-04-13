#include <iostream>
using namespace std;
extern "C"
{
    extern void hello();
}
int main()
{
    hello();
    cin.get();
    return 0;
}