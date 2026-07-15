Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_ASSOC_LIST_027.
Fixpoint v70_lookup_27 (k : nat) (xs : list (nat * nat)) : option nat :=
  match xs with
  | [] => None
  | (k', v) :: rest => if Nat.eqb k k' then Some v else v70_lookup_27 k rest
  end.

Definition v70_update_27 (k v : nat) (xs : list (nat * nat)) : list (nat * nat) :=
  (k, v) :: xs.

Theorem v70_lookup_update_same_27 : forall k v xs,
  v70_lookup_27 k (v70_update_27 k v xs) = Some v.
Proof.
  intros k v xs. unfold v70_update_27. simpl. now rewrite Nat.eqb_refl.
Qed.

Theorem v70_lookup_empty_27 : forall k : nat,
  v70_lookup_27 k [] = None.
Proof.
  reflexivity.
Qed.
End V70_ASSOC_LIST_027.

