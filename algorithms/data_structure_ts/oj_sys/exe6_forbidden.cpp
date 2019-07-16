#include <iostream>
#include <cstdint>
#include <thread>

using namespace std;

static int32_t cache[1000001] = {0};

void getter(int32_t n)
{
	int32_t a, b;
	for(auto i=0;i<n;i++)
	{
		cin >> a >> b;
		cache[i] = a + b;
	}
}

void setter(const int32_t n)
{
	int32_t i = 0;
	while(i<n)
	{
		const auto v = cache[i];
		if(v>0)
		{
			cout << v << endl;
			i++;
		}
	}
}

int main()
{
	ios_base::sync_with_stdio(false);
	int32_t n;
	cin >> n;
	std::thread t1{ getter, n };
	t1.detach();
	std::thread t2{ setter,n };
	t2.join();
	return 0;
}