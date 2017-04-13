// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// test w/ `pub run test -N one_member_abstracts`

abstract class X {
  int f() => 42;
}

abstract class Y {
  int x;
  int f();
}

abstract class Predicate //LINT [16:9]
{
  test();
}

abstract class Z extends X {
  test();
}

abstract class ZZ extends Predicate {}

abstract class Config {
  String get datasetId; //OK -- Issue #64
}
