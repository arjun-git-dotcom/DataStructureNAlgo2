class Node<K, V> {
  K key;
  V value;
  Node? next;
  Node(this.key, this.value, [this.next]);
}

class Hashtable {
  int size;
  List<Node<dynamic, dynamic>?> table;

  Hashtable(this.size)  : table = List<Node<dynamic, dynamic>?>.filled(size, null);
  hash(dynamic key) {
    return key.hashCode % size;
  }

  insert(dynamic key, dynamic value) {
    int index = hash(key);
    Node<dynamic, dynamic>? bucket = table[index];

    while (bucket != null) {
      if (bucket.key == key) {
        bucket.value = value;
        return;
      }
      bucket = bucket.next;
    }

    table[index] = Node<dynamic, dynamic>(key, value, table[index]);
  }

  get() {
    for (int i = 0; i < table.length; i++) {
      Node<dynamic, dynamic>? bucket = table[i];

      while (bucket != null) {
        print(bucket.value);
        bucket = bucket.next;
      }
    }
  }

  delete(var key) {
    int index = hash(key);
    Node<dynamic, dynamic>? currentNode = table[index];
    Node<dynamic, dynamic>? previousNode;

    while (currentNode != null) {
      if (currentNode.key == key) {
        if (previousNode == null) {
          table[index] = currentNode.next;
        } else {
          previousNode.next = currentNode.next;
        }
      }
      previousNode = currentNode;
      currentNode = currentNode?.next;
    }
  }
}

void main() {
  Hashtable ht = Hashtable(5);
  ht.insert('apple', 99999);
  ht.insert('orange', 504545);
  ht.delete('orange');
  ht.get();
}
