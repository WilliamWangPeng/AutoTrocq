(* V63 library-style representation-migration module *)
(* PATTERN: accumulator *)
(* TRANSFER_SHAPE: algorithm refinement *)
(* OBLIGATIONS: 3 *)

Module V63_accumulator_047.
Require Import Coq.Lists.List.
Require Import Coq.Arith.PeanoNat.
Require Import Coq.micromega.Lia.
Import ListNotations.

Fixpoint sum_47 (xs : list nat) : nat :=
  match xs with
  | [] => 0
  | x :: rest => x + sum_47 rest
  end.

Fixpoint sum_acc_47 (xs : list nat) (acc : nat) : nat :=
  match xs with
  | [] => acc
  | x :: rest => sum_acc_47 rest (acc + x)
  end.

Theorem sum_acc_correct_47 : forall xs acc, sum_acc_47 xs acc = acc + sum_47 xs.
Proof.
  induction xs as [|x xs IH]; intro acc; simpl.
  - now rewrite Nat.add_0_r.
  - rewrite IH.
    lia.
Qed.

Theorem sum_acc_zero_47 : forall xs, sum_acc_47 xs 0 = sum_47 xs.
Proof.
  intro xs.
  rewrite sum_acc_correct_47.
  reflexivity.
Qed.

Theorem sum_nil_47 : sum_47 [] = 0.
Proof. reflexivity. Qed.
End V63_accumulator_047.

