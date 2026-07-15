(* V63 library-style representation-migration module *)
(* PATTERN: accumulator *)
(* TRANSFER_SHAPE: algorithm refinement *)
(* OBLIGATIONS: 3 *)

Module V63_accumulator_062.
Require Import Coq.Lists.List.
Require Import Coq.Arith.PeanoNat.
Require Import Coq.micromega.Lia.
Import ListNotations.

Fixpoint sum_62 (xs : list nat) : nat :=
  match xs with
  | [] => 0
  | x :: rest => x + sum_62 rest
  end.

Fixpoint sum_acc_62 (xs : list nat) (acc : nat) : nat :=
  match xs with
  | [] => acc
  | x :: rest => sum_acc_62 rest (acc + x)
  end.

Theorem sum_acc_correct_62 : forall xs acc, sum_acc_62 xs acc = acc + sum_62 xs.
Proof.
  induction xs as [|x xs IH]; intro acc; simpl.
  - now rewrite Nat.add_0_r.
  - rewrite IH.
    lia.
Qed.

Theorem sum_acc_zero_62 : forall xs, sum_acc_62 xs 0 = sum_62 xs.
Proof.
  intro xs.
  rewrite sum_acc_correct_62.
  reflexivity.
Qed.

Theorem sum_nil_62 : sum_62 [] = 0.
Proof. reflexivity. Qed.
End V63_accumulator_062.

