(* V63 library-style representation-migration module *)
(* PATTERN: assoc-update *)
(* TRANSFER_SHAPE: lookup/update preservation *)
(* OBLIGATIONS: 3 *)

Module V63_assoc_update_034.
Require Import Coq.Arith.PeanoNat.
Require Import Coq.Lists.List.
Import ListNotations.

Fixpoint lookup_34 (k : nat) (xs : list (nat * nat)) : option nat :=
  match xs with
  | [] => None
  | (k', v) :: rest => if Nat.eqb k k' then Some v else lookup_34 k rest
  end.

Definition update_34 (k v : nat) (xs : list (nat * nat)) : list (nat * nat) :=
  (k, v) :: xs.

Theorem lookup_update_same_34 : forall k v xs, lookup_34 k (update_34 k v xs) = Some v.
Proof.
  intros k v xs.
  unfold update_34.
  simpl.
  now rewrite Nat.eqb_refl.
Qed.

Theorem lookup_update_other_34 :
  forall k j v xs, Nat.eqb j k = false -> lookup_34 j (update_34 k v xs) = lookup_34 j xs.
Proof.
  intros k j v xs H.
  unfold update_34.
  simpl.
  now rewrite H.
Qed.

Theorem lookup_empty_34 : forall k, lookup_34 k [] = None.
Proof. reflexivity. Qed.
End V63_assoc_update_034.

