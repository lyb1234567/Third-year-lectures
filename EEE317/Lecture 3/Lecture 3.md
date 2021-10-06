### information entropy

$$
I=-log_{2}(p(m))\\
H=\sum_{i=1}^{N}p(i)I=-\sum_{i=1}^{N}p(i)log_{2}(p(i))
$$



### Huffman coding and variable length codes

| Message(M) | Probability(P(M)) |
| ---------- | ----------------- |
| a          | 0.73              |
| b          | 0.25              |
| c          | 0.02              |



And there are a number of possible coding schemes which are possible number arrangements:

| M    | 1    | 2    | 3    | 4    | 5    |
| ---- | ---- | ---- | ---- | ---- | ---- |
| a    | 00   | 00   | 0    | 1    | 1    |
| b    | 00   | 01   | 1    | 10   | 01   |
| c    | 01   | 10   | 11   | 100  | 00   |

1. This is not appropriate because each code is not unique.
2. This is not appropriate because the code is not variable length.
3. This is no good because if we sent 11 it could mean c or bb.
4. This looks good but it is not prefix-free(A prefix-free code is an **instantaneously decodable code**, whose decoding can be performed as immediately as a codeword is found on successive receipt of the code symbols.)



Now we can introduce Huffman coding, **Huffman code** is a particular type of optimal [prefix code](https://en.wikipedia.org/wiki/Prefix_code) that is commonly used for [lossless data compression](https://en.wikipedia.org/wiki/Lossless_data_compression). 

![Huffman coding.PNG](https://github.com/lyb1234567/Third-year-lectures/blob/master/EEE317/Lecture%203/Huffman%20coding.PNG?raw=true)

总的来说，就是先将信息按照可能性递减排序，然后最底下两个结合，然后继续依照前面顺序排序，知道最终只剩两个，即上图中的0.74 和 0.26，然后将上面的设置为最初前缀1，下面的设置为最初前缀0，然后依次传给后面，假如为**上**就是往后放1，假如为**下**就往后0，如上图所示，第二个和中，因为0.14在上，由于前缀为0，那么就是01，0.12在下，就是00.

### Run Length Encoding (RLE)

- Variable data rate required - the channel bandwidth will be constant, so buffers are needed. 
- A bit error can cause large areas of picture to be incorrect - a low error rate is needed. 

Run Length Encoding is a lossless data compression algorithm. It compresses data by reducing repetitive, and consecutive data called **runs**.

**Example**

1. For the text `AAAAAAAAAAAAAHHHEEM` (*19 characters*), RLE will encode it to `13A3H2EM` (7 characters).
2. For the text `AAAAHHHEEM, HAHA.`, it will be encoded as `4A3H2E1M1,1 1H1A1H1A1.` (*21 characters*).



**implementation** 

```python
def encode_message(message):
    encoded_string = ""
    i = 0
    while (i <= len(message)-1):
        count = 1
        ch = message[i]
        j = i
        while (j < len(message)-1):

            if (message[j] == message[j + 1]):
                count = count + 1
                j = j + 1
            else:
                break

        encoded_string = encoded_string + str(count) + ch
        i = j + 1
    return encoded_string
def decode(our_message):
    decoded_message = ""
    i = 0
    j = 0
    # splitting the encoded message into respective counts
    while (i <= len(our_message) - 1):
        run_count = int(our_message[i])
        run_word = our_message[i + 1]
        # displaying the character multiple times specified by the count
        for j in range(run_count):
            # concatenated with the decoded message
            decoded_message = decoded_message+run_word
            j = j + 1
        i = i + 2
    return decoded_message
```

