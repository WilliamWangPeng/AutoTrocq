(* V63 library-style representation-migration module *)
(* PATTERN: assoc-update *)
(* TRANSFER_SHAPE: lookup/update preservation *)
(* OBLIGATIONS: 3 *)

Module V63_assoc_update_071.
Require Import Coq.Arith.PeanoNat.
Require Import Coq.Lists.List.
Import ListNotations.

Fixpoint lookup_71 (k : nat) (xs : list (nat * nat)) : option nat :=
  match xs with
  | [] => None
  | (k', v) :: rest => if Nat.eqb k k' then Some v else lookup_71 k rest
  end.

Definition update_71 (k v : nat) (xs : list (nat * nat)) : list (nat * nat) :=
  (k, v) :: xs.

Theorem lookup_update_same_71 : forall k v xs, lookup_71 k (update_71 k v xs) = Some v.
Proof.
  intros k v xs.
  unfold update_71.
  simpl.
  now rewrite Nat.eqb_refl.
Qed.

Theorem lookup_update_other_71 :
  forall k j v xs, Nat.eqb j k = false -> lookup_71 j (update_71 k v xs) = lookup_71 j xs.
Proof.
  intros k j v xs H.
  unfold update_71.
  simpl.
  now rewrite H.
Qed.

Theorem lookup_empty_71 : forall k, lookup_71 k [] = None.
Proof. reflexivity. Qed.
End V63_assoc_update_071.

