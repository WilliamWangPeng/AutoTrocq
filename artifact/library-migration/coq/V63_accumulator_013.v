(* V63 library-style representation-migration module *)
(* PATTERN: accumulator *)
(* TRANSFER_SHAPE: algorithm refinement *)
(* OBLIGATIONS: 3 *)

Module V63_accumulator_013.
Require Import Coq.Lists.List.
Require Import Coq.Arith.PeanoNat.
Require Import Coq.micromega.Lia.
Import ListNotations.

Fixpoint sum_13 (xs : list nat) : nat :=
  match xs with
  | [] => 0
  | x :: rest => x + sum_13 rest
  end.

Fixpoint sum_acc_13 (xs : list nat) (acc : nat) : nat :=
  match xs with
  | [] => acc
  | x :: rest => sum_acc_13 rest (acc + x)
  end.

Theorem sum_acc_correct_13 : forall xs acc, sum_acc_13 xs acc = acc + sum_13 xs.
Proof.
  induction xs as [|x xs IH]; intro acc; simpl.
  - now rewrite Nat.add_0_r.
  - rewrite IH.
    lia.
Qed.

Theorem sum_acc_zero_13 : forall xs, sum_acc_13 xs 0 = sum_13 xs.
Proof.
  intro xs.
  rewrite sum_acc_correct_13.
  reflexivity.
Qed.

Theorem sum_nil_13 : sum_13 [] = 0.
Proof. reflexivity. Qed.
End V63_accumulator_013.

