# Part A
data BinTree<a>:
  | leaf(val :: a)
  | node(left :: BinTree<a>, right :: BinTree<a>)
end
from __future__ import annotations
from dataclasses import dataclass
from typing import Callable, Generic, TypeVar, Union

A = TypeVar("A")
B = TypeVar("B")


@dataclass(frozen=True)
class Leaf(Generic[A]):
    val: A


@dataclass(frozen=True)
class Node(Generic[A]):
    left: BinTree[A]
    right: BinTree[A]


BinTree = Union[Leaf[A], Node[A]]
 Examples (numbers)
num_leaf = Leaf(7)
num_small = Node(Leaf(1), Leaf(2))
num_lopsided = Node(Node(Leaf(1), Leaf(2)), Leaf(3))
# The tree from the problem statement:
num_big = Node(
    Node(Leaf(1),
         Node(
             Node(
                 Node(Leaf(2), Leaf(3)),
                 Leaf(4)),
             Leaf(5))),
    Leaf(6))

# Examples (strings)
str_leaf = Leaf("a")
str_tree = Node(Node(Leaf("cat"), Leaf("dog")), Leaf("fish"))