Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_BOOL_REFLECT_006.
Definition v70_guard_6 (b c : bool) : bool := andb b c.

Theorem v70_guard_true_r_6 : forall b : bool,
  v70_guard_6 b true = b.
Proof.
  destruct b; reflexivity.
Qed.

Theorem v70_guard_false_r_6 : forall b : bool,
  v70_guard_6 b false = false.
Proof.
  destruct b; reflexivity.
Qed.
End V70_BOOL_REFLECT_006.

