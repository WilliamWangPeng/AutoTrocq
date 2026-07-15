(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_049.
Record point_49 := mkPoint_49 { x_49 : nat; y_49 : nat }.

Definition to_pair_49 (p : point_49) : nat * nat := (x_49 p, y_49 p).
Definition from_pair_49 (q : nat * nat) : point_49 := mkPoint_49 (fst q) (snd q).
Definition weight_point_49 (p : point_49) : nat := x_49 p + y_49 p.
Definition weight_pair_49 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_49 : forall p : point_49, from_pair_49 (to_pair_49 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_49 : forall q : nat * nat, to_pair_49 (from_pair_49 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_49 : forall p : point_49, weight_pair_49 (to_pair_49 p) = weight_point_49 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_049.

