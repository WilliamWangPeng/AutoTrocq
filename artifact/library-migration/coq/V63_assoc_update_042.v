(* V63 library-style representation-migration module *)
(* PATTERN: assoc-update *)
(* TRANSFER_SHAPE: lookup/update preservation *)
(* OBLIGATIONS: 3 *)

Module V63_assoc_update_042.
Require Import Coq.Arith.PeanoNat.
Require Import Coq.Lists.List.
Import ListNotations.

Fixpoint lookup_42 (k : nat) (xs : list (nat * nat)) : option nat :=
  match xs with
  | [] => None
  | (k', v) :: rest => if Nat.eqb k k' then Some v else lookup_42 k rest
  end.

Definition update_42 (k v : nat) (xs : list (nat * nat)) : list (nat * nat) :=
  (k, v) :: xs.

Theorem lookup_update_same_42 : forall k v xs, lookup_42 k (update_42 k v xs) = Some v.
Proof.
  intros k v xs.
  unfold update_42.
  simpl.
  now rewrite Nat.eqb_refl.
Qed.

Theorem lookup_update_other_42 :
  forall k j v xs, Nat.eqb j k = false -> lookup_42 j (update_42 k v xs) = lookup_42 j xs.
Proof.
  intros k j v xs H.
  unfold update_42.
  simpl.
  now rewrite H.
Qed.

Theorem lookup_empty_42 : forall k, lookup_42 k [] = None.
Proof. reflexivity. Qed.
End V63_assoc_update_042.

