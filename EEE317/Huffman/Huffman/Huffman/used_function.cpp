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
void test_sort()
{
	Node a('a', 1);
	Node b('b', 2);
	Node c('c', 3);
	List lst;
	lst.push_tail(b.data,b.prob);
	lst.push_tail(a.data, a.prob);
	lst.push_tail(c.data, c.prob);
	lst.print_list();
	cout << endl;
	lst.sort();
	lst.print_list();
}