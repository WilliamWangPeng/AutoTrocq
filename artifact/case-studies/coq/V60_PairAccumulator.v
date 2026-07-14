(* V60 case-study module *)
(* PATTERN: accumulator refinement *)
(* TRANSFER_SHAPE: fold preservation *)

Module V60_PairAccumulator.
Require Import Coq.Arith.PeanoNat.
Require Import Coq.Lists.List.
Import ListNotations.

Fixpoint sum (xs : list nat) : nat :=
  match xs with
  | [] => 0
  | x :: rest => x + sum rest
  end.

Fixpoint sum_acc (xs : list nat) (acc : nat) : nat :=
  match xs with
  | [] => acc
  | x :: rest => sum_acc rest (acc + x)
  end.

Theorem sum_acc_correct_aux : forall xs acc, sum_acc xs acc = acc + sum xs.
Proof.
  induction xs as [|x xs IH]; intro acc; simpl.
  - now rewrite Nat.add_0_r.
  - rewrite IH.
    rewrite Nat.add_assoc.
    replace (x + sum xs) with (sum xs + x) by apply Nat.add_comm.
    now rewrite <- Nat.add_assoc.
Qed.

Theorem sum_acc_correct : forall xs, sum_acc xs 0 = sum xs.
Proof.
  intro xs.
  rewrite sum_acc_correct_aux.
  reflexivity.
Qed.

Theorem sum_app : forall xs ys, sum (xs ++ ys) = sum xs + sum ys.
Proof.
  induction xs as [|x xs IH]; intro ys; simpl.
  - reflexivity.
  - rewrite IH.
    now rewrite Nat.add_assoc.
Qed.
End V60_PairAccumulator.

