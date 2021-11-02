#include<iostream>
#include<vector>
#include<algorithm>
#include"used_function.h"
#include"linked_list.h"
#include"Huffman.h"
bool comp(pair<char, int>& a, pair<char, int>& b)
{
	return a.second <b.second;
}
List test_list()
{
	Huffman h("sdasdas asdas asd sa p", 1);
	List lst;
	vector<pair<char, int>>freq = h.frequency();
	Node a('a', 1);
	
	for (auto&it:freq)
	{
		lst.push_tail(it.first, it.second);
	}
	lst.print_list();
	return lst;
}