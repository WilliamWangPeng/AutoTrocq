(* V63 library-style representation-migration module *)
(* PATTERN: assoc-update *)
(* TRANSFER_SHAPE: lookup/update preservation *)
(* OBLIGATIONS: 3 *)

Module V63_assoc_update_059.
Require Import Coq.Arith.PeanoNat.
Require Import Coq.Lists.List.
Import ListNotations.

Fixpoint lookup_59 (k : nat) (xs : list (nat * nat)) : option nat :=
  match xs with
  | [] => None
  | (k', v) :: rest => if Nat.eqb k k' then Some v else lookup_59 k rest
  end.

Definition update_59 (k v : nat) (xs : list (nat * nat)) : list (nat * nat) :=
  (k, v) :: xs.

Theorem lookup_update_same_59 : forall k v xs, lookup_59 k (update_59 k v xs) = Some v.
Proof.
  intros k v xs.
  unfold update_59.
  simpl.
  now rewrite Nat.eqb_refl.
Qed.

Theorem lookup_update_other_59 :
  forall k j v xs, Nat.eqb j k = false -> lookup_59 j (update_59 k v xs) = lookup_59 j xs.
Proof.
  intros k j v xs H.
  unfold update_59.
  simpl.
  now rewrite H.
Qed.

Theorem lookup_empty_59 : forall k, lookup_59 k [] = None.
Proof. reflexivity. Qed.
End V63_assoc_update_059.

