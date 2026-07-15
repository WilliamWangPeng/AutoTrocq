(* V63 library-style representation-migration module *)
(* PATTERN: accumulator *)
(* TRANSFER_SHAPE: algorithm refinement *)
(* OBLIGATIONS: 3 *)

Module V63_accumulator_035.
Require Import Coq.Lists.List.
Require Import Coq.Arith.PeanoNat.
Require Import Coq.micromega.Lia.
Import ListNotations.

Fixpoint sum_35 (xs : list nat) : nat :=
  match xs with
  | [] => 0
  | x :: rest => x + sum_35 rest
  end.

Fixpoint sum_acc_35 (xs : list nat) (acc : nat) : nat :=
  match xs with
  | [] => acc
  | x :: rest => sum_acc_35 rest (acc + x)
  end.

Theorem sum_acc_correct_35 : forall xs acc, sum_acc_35 xs acc = acc + sum_35 xs.
Proof.
  induction xs as [|x xs IH]; intro acc; simpl.
  - now rewrite Nat.add_0_r.
  - rewrite IH.
    lia.
Qed.

Theorem sum_acc_zero_35 : forall xs, sum_acc_35 xs 0 = sum_35 xs.
Proof.
  intro xs.
  rewrite sum_acc_correct_35.
  reflexivity.
Qed.

Theorem sum_nil_35 : sum_35 [] = 0.
Proof. reflexivity. Qed.
End V63_accumulator_035.

