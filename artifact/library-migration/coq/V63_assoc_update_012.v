(* V63 library-style representation-migration module *)
(* PATTERN: assoc-update *)
(* TRANSFER_SHAPE: lookup/update preservation *)
(* OBLIGATIONS: 3 *)

Module V63_assoc_update_012.
Require Import Coq.Arith.PeanoNat.
Require Import Coq.Lists.List.
Import ListNotations.

Fixpoint lookup_12 (k : nat) (xs : list (nat * nat)) : option nat :=
  match xs with
  | [] => None
  | (k', v) :: rest => if Nat.eqb k k' then Some v else lookup_12 k rest
  end.

Definition update_12 (k v : nat) (xs : list (nat * nat)) : list (nat * nat) :=
  (k, v) :: xs.

Theorem lookup_update_same_12 : forall k v xs, lookup_12 k (update_12 k v xs) = Some v.
Proof.
  intros k v xs.
  unfold update_12.
  simpl.
  now rewrite Nat.eqb_refl.
Qed.

Theorem lookup_update_other_12 :
  forall k j v xs, Nat.eqb j k = false -> lookup_12 j (update_12 k v xs) = lookup_12 j xs.
Proof.
  intros k j v xs H.
  unfold update_12.
  simpl.
  now rewrite H.
Qed.

Theorem lookup_empty_12 : forall k, lookup_12 k [] = None.
Proof. reflexivity. Qed.
End V63_assoc_update_012.

