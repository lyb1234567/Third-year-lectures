#include"linked_list.h"
int List::len()
{
    int i = 0;
    Node* temp = head;
    while (temp != NULL)
    {
        i = i + 1;
        temp = temp->next;
    }
    return i;
}
void List::push_head(char new_data,float new_prob)
{
    Node* new_node = new Node();
    new_node->data = new_data;
    new_node->prob = new_prob;
    new_node->next = head;
    new_node->prev = NULL;
    if (head)
    {
        head->prev = new_node;
    }
    head = new_node;
}
void List::push_head(Node* node)
{
    node->next = head;
    node->prev = NULL;
    if (head)
    {
        head->prev = node;
    }
    head = node;
}
void List::push_tail(char new_data,float new_prob)
{
    Node* temp = new Node();
    temp->data = new_data;
    temp->prob = new_prob;
    temp->next = NULL;
    if (head == NULL)
    {
        push_head(new_data,new_prob);
    }
    else
    {
        Node* p = head;
        while (p->next != NULL)
        {
            p = p->next;
        }
        p->next = temp;
        temp->prev = p;
        return;
    }
}
string List::str()
{
    Node* temp = head;
    string a = "";
    while (temp)
    {
        a = a + temp->data;
        temp = temp->next;
    }
    return a;
}
void List::push_tail(Node* node)
{
    Node* temp = head;
    node->next = NULL;
    if (head == NULL)
    {
        head = node;
        return;
    }
    else 
    {
        while (temp->next)
        {
            temp = temp->next;
        }
        temp->next = node;
        node->prev = temp;
    }
    return;

}
List List::slice(int start, int end)
{
    int s = 0;
    int e = len() - 1;
    Node* temp = head;
    List new_list;
    while (temp)
    {
        if (s == start)
        {
            new_list.push_tail(temp->data,temp->prob);
            break;
        }
        s = s + 1;
        temp = temp->next;
    }
    while (temp)
    {
        if (s == end)
        {
            break;
        }
        temp = temp->next;
        new_list.push_tail(temp->data,temp->prob);
        s = s + 1;
    }
    return new_list;
}
bool List::remove(char a)
{
    if (len() == 0)
    {
        return false;
    }
    else
    {
        Node* temp = head;
        if (len() == 1 && temp->data == a)
        {
            head = NULL;
            return true;
        }
        else if (len() == 1 && head->data != a)
        {
            return false;
        }
        else
        {
            Node* prev = temp;
            if (temp->data == a)
            {
                head = temp->next;
                temp->next = NULL;
            }
            else
            {
                while (temp != NULL)
                {
                    if (temp->data == a)
                    {
                        prev->next = temp->next;
                        temp->next = NULL;
                        return true;
                    }
                    prev = temp;
                    temp = temp->next;
                }
                return false;
            }
        }


    }
}
Node* List::get_end()
{
    Node* temp = head;
    while (temp->next)
    {
        temp = temp->next;
    }
    return temp;
}
void List::print_list()
{
    Node* temp = head;
    while (temp)
    {
        cout << temp->data << ":" << temp->prob << "\t";
        temp = temp->next;
    }
    cout << endl;

}
bool List::remove(int n)
{
    int count = 1;
    if (len() == 0)
    {
        return false;
    }
    else
    {
        Node* temp = head;
        Node* prev = temp;
        if (n == 1)
        {
            head = temp->next;
            temp->next = NULL;
        }
        else if (n > 1 && n <= len())
        {
            while (temp)
            {
                if (count == n)
                {
                    prev->next = temp->next;
                    temp->next = NULL;
                    return true;
                }
                count = count + 1;
                prev = temp;
                temp = temp->next;
            }
        }
        else
        {
            return false;
        }
    }



}
void List::sort()
{
    Node* temp = head;
    Node* index;
    if (len() == 0)
    {
        cout << "The list is empty!";
    }
    else
    {
        //scan from the head
        while (temp)
        {
            index = temp->next;
            while (index)
            {
                if (temp->prob > index->prob)
                {
                    char a = temp->data;
                    float b = temp->prob;
                    temp->prob = index->prob;
                    temp->data = index->data;
                    index->prob = b;
                    index->data = a;
                    
                }
                index = index->next;
            }
            temp = temp->next;
        }
    }
}
Node *List::find(int n)
{
    if (len() == 0)
    {
        return NULL;
    }
    else
    {

        int l = len() - 1;
        Node* current = head;
        int position = n - 1;
        if (position < 0 || position > l)
        {
            return nullptr;
        }
        int count = 0;
        while (count != position)
        {
            current = current->next;
            count = count + 1;
        }
        if (current != NULL)
        {
            if (current->data == NULL)
            {
                return NULL;
            }
            if (current->data != NULL)
            {
                return current;
            }
        }
        else
        {
            return NULL;
        }
    }
}