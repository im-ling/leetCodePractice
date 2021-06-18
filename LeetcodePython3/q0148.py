#!/usr/bin/python3
from typing import List


class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next


class Solution:
    def sortList(self, head: ListNode) -> ListNode:
        def merge_list(node1: ListNode, node2: ListNode) -> ListNode:
            pre = ListNode(0)
            p = pre
            while node1 and node2:
                if node1.val <= node2.val:
                    p.next = node1
                    node1 = node1.next
                else:
                    p.next = node2
                    node2 = node2.next
                p = p.next
            if node1:
                p.next = node1
            if node2:
                p.next = node2
            return pre.next

        def sort_helper(node: ListNode) -> ListNode:
            if node is None or node.next is None:
                return node
            slow = node
            fast = node.next
            while fast and fast.next:
                fast = fast.next.next
                slow = slow.next
            new_node = slow.next
            slow.next = None
            head1 = sort_helper(node)
            head2 = sort_helper(new_node)
            return merge_list(head1, head2)

        return sort_helper(head)

    def sortList2(self, head: ListNode) -> ListNode:
        if not head:
            return head
        p = head
        list: List[ListNode] = []
        while p:
            list.append(p)
            p = p.next
        length = len(list)
        for i in range(1, length):
            left = 0
            right = i - 1
            index = i
            while left <= right:
                mid = (left + right) // 2
                if (list[i].val < list[mid].val):
                    index = mid
                    right = mid - 1
                else:
                    left = mid + 1
            if i != index:
                node = list.pop(i)
                list.insert(index, node)
        for i in range(length - 1):
            list[i].next = list[i + 1]
        list[length - 1].next = None
        return list[0]
