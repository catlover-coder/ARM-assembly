#include <iostream>

extern "C" void assembly_start();

extern "C" void print_number(int x)
{
    std::cout << "Number = " << x << std::endl;
}

int main()
{
    assembly_start();
    return 0;
}
