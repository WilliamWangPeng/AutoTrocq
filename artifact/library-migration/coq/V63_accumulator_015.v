(* V63 library-style representation-migration module *)
(* PATTERN: accumulator *)
(* TRANSFER_SHAPE: algorithm refinement *)
(* OBLIGATIONS: 3 *)

Module V63_accumulator_015.
Require Import Coq.Lists.List.
Require Import Coq.Arith.PeanoNat.
Require Import Coq.micromega.Lia.
Import ListNotations.

Fixpoint sum_15 (xs : list nat) : nat :=
  match xs with
  | [] => 0
  | x :: rest => x + sum_15 rest
  end.

Fixpoint sum_acc_15 (xs : list nat) (acc : nat) : nat :=
  match xs with
  | [] => acc
  | x :: rest => sum_acc_15 rest (acc + x)
  end.

Theorem sum_acc_correct_15 : forall xs acc, sum_acc_15 xs acc = acc + sum_15 xs.
Proof.
  induction xs as [|x xs IH]; intro acc; simpl.
  - now rewrite Nat.add_0_r.
  - rewrite IH.
    lia.
Qed.

Theorem sum_acc_zero_15 : forall xs, sum_acc_15 xs 0 = sum_15 xs.
Proof.
  intro xs.
  rewrite sum_acc_correct_15.
  reflexivity.
Qed.

Theorem sum_nil_15 : sum_15 [] = 0.
Proof. reflexivity. Qed.
End V63_accumulator_015.

