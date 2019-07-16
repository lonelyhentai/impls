#include <cstdint>
#include <iostream>

using namespace std;

int main()
{
	int32_t h1, m1, s1, h2, m2, s2;
	char hole;
	cin >> h1 >> hole >> m1 >> hole >> s1 >> h2 >> hole >> m2 >> hole >> s2;
	auto interval = h2 * 3600 + m2 * 60 + s2 - (h1 * 3600 + m1 * 60 + s1);
	if (interval < 0)
	{
		interval += 24 * 3600;
	}
	cout << interval;
	return 0;
}
