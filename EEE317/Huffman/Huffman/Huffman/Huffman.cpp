#include"Huffman.h"
#include<iostream>
#include<string>
#include<map>
#include<vector>
#include<algorithm>
#include<unordered_map>
#include"used_function.h"
using namespace std;
vector<pair<char, int>>Huffman::frequency()
{
	int len = message.length();
	unordered_map<char, int> freq;
	for (int i = 0; i < len; i++)
	{
		if (freq[message[i]] == 0)
		{
			freq[message[i]] = 1;
		}
		else if (freq[message[i]] > 0)
		{
			freq[message[i]] += 1;
		}
	}
	vector<pair<char, int>>new_freq;
	for (auto& it : freq)
	{
		new_freq.push_back(it);
	}
	sort(new_freq.begin(), new_freq.end(), comp);
	return new_freq;

}
vector<pair<char, int>> Huffman::probability()
{
	vector<pair<char, int>>freq = frequency();
	float sum = 0.0;
	for (auto& it : freq)
	{
		sum = sum + it.second;
	}
	cout << sum << endl;
	vector<pair<char, int>> prob;
	for (auto& it : freq)
	{
		prob.push_back(it);
	}
	return prob;
}
