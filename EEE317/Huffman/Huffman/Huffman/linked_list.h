#ifndef LINKED_H_
#define LINKED_H_
#include<string>
#include<iostream>
#include"Huffman.h"
using namespace std;
class Node
{
public:
	char data;
	float prob;
	Node* next = NULL;
	Node* prev = NULL;
	bool used = false;
	Node(char dt, float pb)
	{
		prob = pb;
		data = dt;
	}
	Node()
	{
		data = NULL;
		prob = 0.0;
	}
};
class Tree
{
public:
	char data;
	float prob;
	Tree* head = NULL;
	Node* left = NULL;
	Node* right = NULL;
	Tree(char dt, float pb)
	{
		prob = pb;
		data = dt;
	}
	Tree()
	{
		data = NULL;
		prob = 0.0;
	}
};
class List
{
private:
	Node* head = NULL;
	Node* tail = NULL;
public:
	Node* get_end();
	string str();
	List(string& a);
	List(const char*);
	List() {};
	void push_head(Node* node);
	void push_head(char new_data,float new_prob);
	void print_list();
	void push_tail(char new_data,float new_prob);
	void push_tail(Node* node);
	List slice(int start, int end);
	bool remove(int n);
	bool remove(char a);
	Node* get_head() { return head; };
	Node * find(int index);
	void sort();
	int len();
};
#endif
#pragma once