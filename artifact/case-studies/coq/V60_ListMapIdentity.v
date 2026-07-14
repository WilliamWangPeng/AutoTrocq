(* V60 case-study module *)
(* PATTERN: list invariant *)
(* TRANSFER_SHAPE: structure preservation *)

Module V60_ListMapIdentity.
Require Import Coq.Lists.List.
Import ListNotations.

Fixpoint map_id (xs : list nat) : list nat :=
  match xs with
  | [] => []
  | x :: rest => x :: map_id rest
  end.

Theorem map_id_identity : forall xs : list nat, map_id xs = xs.
Proof.
  induction xs as [|x xs IH]; simpl; now rewrite ?IH.
Qed.

Theorem map_id_length : forall xs : list nat, length (map_id xs) = length xs.
Proof.
  intro xs.
  now rewrite map_id_identity.
Qed.

Theorem map_id_app : forall xs ys : list nat, map_id (xs ++ ys) = map_id xs ++ map_id ys.
Proof.
  induction xs as [|x xs IH]; intros ys; simpl; now rewrite ?IH.
Qed.
End V60_ListMapIdentity.

