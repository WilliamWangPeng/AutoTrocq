(* V63 library-style representation-migration module *)
(* PATTERN: accumulator *)
(* TRANSFER_SHAPE: algorithm refinement *)
(* OBLIGATIONS: 3 *)

Module V63_accumulator_022.
Require Import Coq.Lists.List.
Require Import Coq.Arith.PeanoNat.
Require Import Coq.micromega.Lia.
Import ListNotations.

Fixpoint sum_22 (xs : list nat) : nat :=
  match xs with
  | [] => 0
  | x :: rest => x + sum_22 rest
  end.

Fixpoint sum_acc_22 (xs : list nat) (acc : nat) : nat :=
  match xs with
  | [] => acc
  | x :: rest => sum_acc_22 rest (acc + x)
  end.

Theorem sum_acc_correct_22 : forall xs acc, sum_acc_22 xs acc = acc + sum_22 xs.
Proof.
  induction xs as [|x xs IH]; intro acc; simpl.
  - now rewrite Nat.add_0_r.
  - rewrite IH.
    lia.
Qed.

Theorem sum_acc_zero_22 : forall xs, sum_acc_22 xs 0 = sum_22 xs.
Proof.
  intro xs.
  rewrite sum_acc_correct_22.
  reflexivity.
Qed.

Theorem sum_nil_22 : sum_22 [] = 0.
Proof. reflexivity. Qed.
End V63_accumulator_022.

