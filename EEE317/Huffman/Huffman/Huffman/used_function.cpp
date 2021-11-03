#include<iostream>
#include<vector>
#include<algorithm>
#include"used_function.h"
#include"linked_list.h"
#include"Huffman.h"
/*
    Node a('a', 1);
	Node b('b', 2);
	Node c('c', 3);
	Node d('d',4);
	Node e('e',5);
	Node f('f',6);
	Node h('h',7);
*/
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
void test_tree()
{

	Tree t;
	List l;
	Node a('a', 1);
	Node b('b', 2);
	Node c('c', 3);
	Node d('d', 4);
	Node e('e', 5);
	Node f('f', 6);
	Node h('h', 7);
	l.push_tail(a.data,a.prob);
	l.push_tail(b.data, b.prob);
	l.push_tail(c.data, c.prob);
	l.push_tail(d.data, d.prob);
	l.push_tail(e.data, e.prob);
	l.push_tail(f.data, f.prob);
	l.push_tail(h.data, h.prob);
	l.sort();
	Node* end = l.find(l.len());
	while (end)
	{
		l.print_list();
		if (end->used && end->prev->used)
		{
			end = end->prev;
			continue;
		}
		Node* n1 = new Node(end->data, end->prob);
		Node* n2 = new Node(end->prev->data, end->prev->prob);
		Node* n3 = new Node(' ', n1->prob + n2->prob);
		t.head->data = ' ';
		t.head->prob = n1->prob + n2->prob;
		t.head->left = n2;
		t.head->right = n1;
		end->used = true;
		end->prev->used = true;
		end = end->prev;
	}
	
}