// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// RUN: %{explorer} %s 2>&1 | \
// RUN:   %{FileCheck} --match-full-lines --allow-unused-prefixes=false %s
// RUN: %{explorer} --parser_debug --trace_file=- %s 2>&1 | \
// RUN:   %{FileCheck} --match-full-lines --allow-unused-prefixes %s
// AUTOUPDATE: %{explorer} %s
// CHECK: result: 7

package ExplorerTest api;

alias TypeAlias = i32;

fn Function(a: i32, b: TypeAlias) -> i32 { return a + b; }
fn GenericFunction[T:! Type](x: T) -> T { return x; }

alias FunctionAlias = Function;
alias GenericFunctionAlias = GenericFunction;

fn Main() -> i32 { return FunctionAlias(1, 2) + GenericFunctionAlias(4); }
