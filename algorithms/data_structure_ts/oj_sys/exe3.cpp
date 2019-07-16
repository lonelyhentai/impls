#include <iostream>
#include <cstdint>
#include <cmath>
#include <algorithm>

using namespace std;


template<typename T>
constexpr T min_(T a, T b)
{
	return a > b ? b : a; // C++ 11 can only use statement return with constexpr body
}

int64_t gcd(int64_t a, int64_t b)
{
	if (a == 0) return b;
	if (b == 0) return a;
	if(!(a&1) && !(b&1))
	{
		return gcd(a >> 1, b >> 1) << 1;
	}
	else if(!(a&1))
	{
		return gcd(a>>1, b);
	}
	else if(!(b&1))
	{
		return gcd(a, b >> 1);
	}
	else
	{
		return gcd(abs(a - b), min(a, b));
	}
}

int main()
{
	int64_t a, b;
	cin >> a >> b;
	cout << gcd(a, b);
	return 0;
}