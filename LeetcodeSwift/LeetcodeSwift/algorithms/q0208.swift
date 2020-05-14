//
//  q0208.swift
//  LeetcodeSwift
//
//  Created by NowOrNever on 14/05/2020.
//  Copyright © 2020 DL. All rights reserved.
//

import Foundation
//208. Implement Trie (Prefix Tree)
//Medium
//
//2718
//
//45
//
//Add to List
//
//Share
//Implement a trie with insert, search, and startsWith methods.
//
//Example:
//
//Trie trie = new Trie();
//
//trie.insert("apple");
//trie.search("apple");   // returns true
//trie.search("app");     // returns false
//trie.startsWith("app"); // returns true
//trie.insert("app");
//trie.search("app");     // returns true
//Note:
//
//You may assume that all inputs are consist of lowercase letters a-z.
//All inputs are guaranteed to be non-empty strings.
//Accepted
//270,691
//Submissions
//590,676

class TrieNode {
    var dic = [Character: TrieNode]()
    var isEnd = false
}

class Trie {
    let _node = TrieNode()
    /** Initialize your data structure here. */
    init() {
    }
    
    /** Inserts a word into the trie. */
    func insert(_ word: String) {
        var node = _node
        for i in word {
            if node.dic[i] == nil {
                node.dic[i] = TrieNode()
            }
            node = node.dic[i]!
        }
        node.isEnd = true
    }
    
    /** Returns if the word is in the trie. */
    func search(_ word: String) -> Bool {
        var node = _node
        for i in word {
            if (node.dic[i] == nil){
                return false
            }else{
                node = node.dic[i]!
            }
        }
        return node.isEnd
    }
    
    /** Returns if there is any word in the trie that starts with the given prefix. */
    func startsWith(_ prefix: String) -> Bool {
        var node = _node
        for i in prefix {
            if (node.dic[i] == nil){
                return false
            }else{
                node = node.dic[i]!
            }
        }
        return true
    }
}

/**
 * Your Trie object will be instantiated and called as such:
 * let obj = Trie()
 * obj.insert(word)
 * let ret_2: Bool = obj.search(word)
 * let ret_3: Bool = obj.startsWith(prefix)
 */

func q0208(){
    let trie = Trie();
    var result = false
    trie.insert("apple");
    result = trie.search("apple");   // returns true
    print(result)
    result = trie.search("app");     // returns false
    print(result)
    result = trie.startsWith("app"); // returns true
    print(result)
    trie.insert("app");
    result = trie.search("app");     // returns true
    print(result)
}
