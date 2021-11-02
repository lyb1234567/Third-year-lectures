#ifndef HUFFMAN
#define HUFFMAN
#include<string>
#include<unordered_map>
#include <cassert>
using namespace std;
class Huffman
{
private:
	string message;
	int first_num;
public:
	Huffman()
	{
		message = " ";
		first_num = 0;
	};
	Huffman(string st, int first)
	{
		message = st;
		first_num = first;
	}
	vector<pair<char, int>>frequency();
	vector<pair<char, int>>probability();
	float entrophy();
	void print();
};
#endif // !HUFFMAN

#pragma once