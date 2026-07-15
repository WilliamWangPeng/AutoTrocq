(* V63 library-style representation-migration module *)
(* PATTERN: accumulator *)
(* TRANSFER_SHAPE: algorithm refinement *)
(* OBLIGATIONS: 3 *)

Module V63_accumulator_059.
Require Import Coq.Lists.List.
Require Import Coq.Arith.PeanoNat.
Require Import Coq.micromega.Lia.
Import ListNotations.

Fixpoint sum_59 (xs : list nat) : nat :=
  match xs with
  | [] => 0
  | x :: rest => x + sum_59 rest
  end.

Fixpoint sum_acc_59 (xs : list nat) (acc : nat) : nat :=
  match xs with
  | [] => acc
  | x :: rest => sum_acc_59 rest (acc + x)
  end.

Theorem sum_acc_correct_59 : forall xs acc, sum_acc_59 xs acc = acc + sum_59 xs.
Proof.
  induction xs as [|x xs IH]; intro acc; simpl.
  - now rewrite Nat.add_0_r.
  - rewrite IH.
    lia.
Qed.

Theorem sum_acc_zero_59 : forall xs, sum_acc_59 xs 0 = sum_59 xs.
Proof.
  intro xs.
  rewrite sum_acc_correct_59.
  reflexivity.
Qed.

Theorem sum_nil_59 : sum_59 [] = 0.
Proof. reflexivity. Qed.
End V63_accumulator_059.

