(* V63 library-style representation-migration module *)
(* PATTERN: assoc-update *)
(* TRANSFER_SHAPE: lookup/update preservation *)
(* OBLIGATIONS: 3 *)

Module V63_assoc_update_028.
Require Import Coq.Arith.PeanoNat.
Require Import Coq.Lists.List.
Import ListNotations.

Fixpoint lookup_28 (k : nat) (xs : list (nat * nat)) : option nat :=
  match xs with
  | [] => None
  | (k', v) :: rest => if Nat.eqb k k' then Some v else lookup_28 k rest
  end.

Definition update_28 (k v : nat) (xs : list (nat * nat)) : list (nat * nat) :=
  (k, v) :: xs.

Theorem lookup_update_same_28 : forall k v xs, lookup_28 k (update_28 k v xs) = Some v.
Proof.
  intros k v xs.
  unfold update_28.
  simpl.
  now rewrite Nat.eqb_refl.
Qed.

Theorem lookup_update_other_28 :
  forall k j v xs, Nat.eqb j k = false -> lookup_28 j (update_28 k v xs) = lookup_28 j xs.
Proof.
  intros k j v xs H.
  unfold update_28.
  simpl.
  now rewrite H.
Qed.

Theorem lookup_empty_28 : forall k, lookup_28 k [] = None.
Proof. reflexivity. Qed.
End V63_assoc_update_028.

