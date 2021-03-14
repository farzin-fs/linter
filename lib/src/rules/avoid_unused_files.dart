// Copyright (c) 2021, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';

import '../analyzer.dart';

const _desc = r'Remove unused files.';

const _details = r'''

**DO** Remove unused files.

**BAD:**
```

```

**GOOD:**
```

```

''';

class AvoidUnusedFiles extends LintRule implements NodeLintRule {
  AvoidUnusedFiles()
      : super(
            name: 'avoid_unused_files',
            description: _desc,
            details: _details,
            group: Group.style);

  @override
  void registerNodeProcessors(
      NodeLintRegistry registry, LinterContext context) {
    final visitor = _Visitor(this);
    registry.addCompilationUnit(this, visitor);
  }
}

class _Visitor extends SimpleAstVisitor<void> {
  final LintRule rule;

  _Visitor(this.rule);

  @override
  void visitCompilationUnit(CompilationUnit node) {
    var declaredElement = node.declaredElement;
    if (declaredElement != null) {
      final fileName = declaredElement.source.shortName;
      print('jamshid $fileName');
      // if (!isValidDartFileName(fileName)) {
      //   rule.reportLint(node);
      // }
    }
  }
}
