#include <iostream>
#include <cstdint>

using namespace std;

int main()
{
	// can use std::format in c++ 20
	int64_t a, b, res;
	char op;
	cin >> a >> op >> b;
	switch (op)
	{
	case '+':
		res = a + b;
		break;
	case '-':
		res = a - b;
		break;
	case '*':
		res = a * b;
		break;
	default:
		return -1;
		break;
	}
	cout <<  res << endl;
	return 0;
}