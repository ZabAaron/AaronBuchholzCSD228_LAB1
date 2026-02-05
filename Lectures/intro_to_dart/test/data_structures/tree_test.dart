/// Modifications to this file should not be made.
///
/// (9 marks) This acts as a suite to guide you in the right direction.
library;

import 'package:equatable/equatable.dart';
import 'package:intro_to_dart/src/data_structures/tree.dart';
import 'package:test/test.dart';

// Here is a generic test type that allows us to abstract away the implementation
// details of whatever type T may _actually_ be.
class TestItem extends Equatable {
  final String id;
  const TestItem({required this.id});

  @override
  List<Object?> get props => [id];
}

/// Builds a set of test data in a predictable manner.
///
/// Creates a root element that has 5 entries, which for every even indexed
/// entry 4 entries are added as sub entries. This gives a consistent way to
/// test all of the components of the tree.
Node<TestItem> buildTree({String id = 'root'}) => Node(
  item: TestItem(id: id),
  connections: List.generate(
    5,
    (idx) => Node(
      item: TestItem(id: "id$idx"),
      connections: idx % 2 == 0
          ? List.generate(
              4,
              (idx2) => Node(item: TestItem(id: "id${idx}_$idx2")),
            )
          : null,
    ),
  ),
);

void main() {
  final tree = buildTree();

  group('Tree', () {
    group("configures", () {
      test("root", () {
        final testItem = TestItem(id: "root");
        final node = Node(item: testItem);
        final node2 = Node.root(testItem);
        expect(node.isRoot, isTrue);
        expect(node.connections, isNull);
        expect(node.previous, isNull);
        expect(node, node2);
      });
      test("a leaf", () {
        final testItem = TestItem(id: "id");
        final node = Node(
          item: testItem,
          previous: Node(item: TestItem(id: 'root')),
        );

        expect(node.isLeaf, isTrue);
        expect(node.isRoot, isFalse);
      });
      test("a branch", () {
        final testItem = TestItem(id: "id");
        var node = Node(
          item: testItem,
          previous: Node(item: TestItem(id: 'root')),
          connections: [Node(item: TestItem(id: 'connection'))],
        );

        expect(node.isLeaf, isFalse);
      });
    });
    group('search algorithms', () {
      group('bst', () {
        group('returns', () {
          test('null if not found', () {
            expect(
              tree.bfs(
                predicate: (node) =>
                    node.item.id == 'imdefinitelynotinthattree',
              ),
              isNull,
            );
          });
          test('branch / leaf when found', () {
            expect(
              tree.bfs(predicate: (node) => node.item.id == 'id4_3')?.item,
              TestItem(id: 'id4_3'),
            );
          });
          test('itself when root is requested', () {
            expect(tree.bfs(predicate: (node) => node.item.id == 'root'), tree);
          });
        });
      });
      group('dfs', () {
        group('returns', () {
          test('null if not found', () {
            expect(
              tree.dfs(
                predicate: (node) =>
                    node.item.id == 'imdefinitelynotinthattree',
              ),
              isNull,
            );
          });
          test('branch / leaf when found', () {
            expect(
              tree.dfs(predicate: (node) => node.item.id == 'id4_3')?.item,
              TestItem(id: 'id4_3'),
            );
          });
          test('itself when root is requested', () {
            expect(tree.dfs(predicate: (node) => node.item.id == 'root'), tree);
          });
        });
      });
    });
  });
}
