Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_BOOL_REWRITE_MAINTENANCE_013.
Theorem v66_negb_involutive_13 : forall b : bool,
  negb (negb b) = b.
Proof.
  destruct b; reflexivity.
Qed.

Theorem v66_andb_true_r_13 : forall b : bool,
  andb b true = b.
Proof.
  destruct b; reflexivity.
Qed.
End V66_BOOL_REWRITE_MAINTENANCE_013.

