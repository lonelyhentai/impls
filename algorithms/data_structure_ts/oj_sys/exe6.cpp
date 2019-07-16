#include <iostream>
#include <cstdint>
#include <sstream>

using namespace std;
constexpr uint32_t length = 1 << 20;
static char inbuf[length];
static char outbuf[length];
	
int main()
{
    ios_base::sync_with_stdio(false);
    cin.tie(nullptr);
	cin.rdbuf()->pubsetbuf(inbuf, length);
	cout.rdbuf()->pubsetbuf(outbuf, length);
	int32_t n, a, b;
	cin >> n;
	stringstream ss;
	for(auto i=0;i<n;i++)
	{
		cin >> a >> b;
		ss << a + b << endl;
	}
	cout << ss.rdbuf();
	return 0;
}