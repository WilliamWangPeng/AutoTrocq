(* V63 library-style representation-migration module *)
(* PATTERN: accumulator *)
(* TRANSFER_SHAPE: algorithm refinement *)
(* OBLIGATIONS: 3 *)

Module V63_accumulator_014.
Require Import Coq.Lists.List.
Require Import Coq.Arith.PeanoNat.
Require Import Coq.micromega.Lia.
Import ListNotations.

Fixpoint sum_14 (xs : list nat) : nat :=
  match xs with
  | [] => 0
  | x :: rest => x + sum_14 rest
  end.

Fixpoint sum_acc_14 (xs : list nat) (acc : nat) : nat :=
  match xs with
  | [] => acc
  | x :: rest => sum_acc_14 rest (acc + x)
  end.

Theorem sum_acc_correct_14 : forall xs acc, sum_acc_14 xs acc = acc + sum_14 xs.
Proof.
  induction xs as [|x xs IH]; intro acc; simpl.
  - now rewrite Nat.add_0_r.
  - rewrite IH.
    lia.
Qed.

Theorem sum_acc_zero_14 : forall xs, sum_acc_14 xs 0 = sum_14 xs.
Proof.
  intro xs.
  rewrite sum_acc_correct_14.
  reflexivity.
Qed.

Theorem sum_nil_14 : sum_14 [] = 0.
Proof. reflexivity. Qed.
End V63_accumulator_014.

