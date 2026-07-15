(* V63 library-style representation-migration module *)
(* PATTERN: assoc-update *)
(* TRANSFER_SHAPE: lookup/update preservation *)
(* OBLIGATIONS: 3 *)

Module V63_assoc_update_056.
Require Import Coq.Arith.PeanoNat.
Require Import Coq.Lists.List.
Import ListNotations.

Fixpoint lookup_56 (k : nat) (xs : list (nat * nat)) : option nat :=
  match xs with
  | [] => None
  | (k', v) :: rest => if Nat.eqb k k' then Some v else lookup_56 k rest
  end.

Definition update_56 (k v : nat) (xs : list (nat * nat)) : list (nat * nat) :=
  (k, v) :: xs.

Theorem lookup_update_same_56 : forall k v xs, lookup_56 k (update_56 k v xs) = Some v.
Proof.
  intros k v xs.
  unfold update_56.
  simpl.
  now rewrite Nat.eqb_refl.
Qed.

Theorem lookup_update_other_56 :
  forall k j v xs, Nat.eqb j k = false -> lookup_56 j (update_56 k v xs) = lookup_56 j xs.
Proof.
  intros k j v xs H.
  unfold update_56.
  simpl.
  now rewrite H.
Qed.

Theorem lookup_empty_56 : forall k, lookup_56 k [] = None.
Proof. reflexivity. Qed.
End V63_assoc_update_056.

