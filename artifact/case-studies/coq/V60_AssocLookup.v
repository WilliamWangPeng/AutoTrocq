(* V60 case-study module *)
(* PATTERN: association list *)
(* TRANSFER_SHAPE: update/lookup *)

Module V60_AssocLookup.
Require Import Coq.Arith.PeanoNat.
Require Import Coq.Lists.List.
Import ListNotations.

Fixpoint lookup (k : nat) (xs : list (nat * nat)) : option nat :=
  match xs with
  | [] => None
  | (k', v) :: rest => if Nat.eqb k k' then Some v else lookup k rest
  end.

Definition update (k v : nat) (xs : list (nat * nat)) : list (nat * nat) :=
  (k, v) :: xs.

Theorem lookup_update_same : forall k v xs, lookup k (update k v xs) = Some v.
Proof.
  intros k v xs.
  unfold update.
  simpl.
  now rewrite Nat.eqb_refl.
Qed.

Theorem lookup_update_other :
  forall k j v xs, Nat.eqb j k = false -> lookup j (update k v xs) = lookup j xs.
Proof.
  intros k j v xs H.
  unfold update.
  simpl.
  now rewrite H.
Qed.

Theorem lookup_empty : forall k, lookup k [] = None.
Proof. reflexivity. Qed.
End V60_AssocLookup.

