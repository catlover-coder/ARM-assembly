#include <iostream>

extern "C" int add_numbers(int a, int b);

int main()
{
    int result = add_numbers(15, 27);

    std::cout << "Answer = " << result << std::endl;

    return 0;
}
