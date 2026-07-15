(* V63 library-style representation-migration module *)
(* PATTERN: accumulator *)
(* TRANSFER_SHAPE: algorithm refinement *)
(* OBLIGATIONS: 3 *)

Module V63_accumulator_033.
Require Import Coq.Lists.List.
Require Import Coq.Arith.PeanoNat.
Require Import Coq.micromega.Lia.
Import ListNotations.

Fixpoint sum_33 (xs : list nat) : nat :=
  match xs with
  | [] => 0
  | x :: rest => x + sum_33 rest
  end.

Fixpoint sum_acc_33 (xs : list nat) (acc : nat) : nat :=
  match xs with
  | [] => acc
  | x :: rest => sum_acc_33 rest (acc + x)
  end.

Theorem sum_acc_correct_33 : forall xs acc, sum_acc_33 xs acc = acc + sum_33 xs.
Proof.
  induction xs as [|x xs IH]; intro acc; simpl.
  - now rewrite Nat.add_0_r.
  - rewrite IH.
    lia.
Qed.

Theorem sum_acc_zero_33 : forall xs, sum_acc_33 xs 0 = sum_33 xs.
Proof.
  intro xs.
  rewrite sum_acc_correct_33.
  reflexivity.
Qed.

Theorem sum_nil_33 : sum_33 [] = 0.
Proof. reflexivity. Qed.
End V63_accumulator_033.

