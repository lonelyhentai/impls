#include <iostream>
#include <string>

using namespace std;

constexpr int upper_a = static_cast<int>('A');
constexpr int lower_a = static_cast<int>('a');

int main()
{
	string input;
	getline(cin, input);
	int counter[26] = {};
	for (auto c : input)
	{
		const auto cv = static_cast<int>(c);
		const auto upper_dis = cv - upper_a;
		if (upper_dis >= 0 && upper_dis < 26)
		{
			counter[upper_dis]++;
			continue;
		}
		const auto lower_dis = cv - lower_a;
		if (lower_dis >= 0 && lower_dis < 26)
		{
			counter[lower_dis] ++;
		}
	}
	for (auto i = 0; i < 26; i++)
	{
		const auto count = counter[i];
		if (count)
		{
			cout << static_cast<char>(upper_a + i) << ": " << count << endl;
		}
	}
	return 0;
}
