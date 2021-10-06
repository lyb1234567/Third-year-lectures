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

