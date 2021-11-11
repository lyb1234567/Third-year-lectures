#include<iostream>
#include<map>
#include <cassert>
#include<vector>
#include <algorithm> 
#include"Huffman.h"
#include"linked_list.h"
#include"used_function.h"
using namespace std;
// Driver Code
int main()
{
	/*List lst = test_list();
	Node* temp = lst.get_head();
	Tree_node tree;
	while (temp)
	{
		Tree_node n1(temp->data, temp->prob);
		Tree_node n2(temp->next->data, temp->data);
		Node *new_node =new Node(' ', n1.prob + n2.prob);
		Tree_node n3(new_node->data, new_node->prob);
		lst.remove(1);
		lst.remove(2);
		lst.push_head(new_node);
		temp = lst.get_head();
		temp = temp->next;
	}*/
	float a, b, c;

	printf("Please input a value a : ");
	scanf("%f %f %f", &a,&b,&c);
	printf("%f %f", a+b);
	return 0;
	return(0);

}