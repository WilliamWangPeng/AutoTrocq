(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_012.
Record point_12 := mkPoint_12 { x_12 : nat; y_12 : nat }.

Definition to_pair_12 (p : point_12) : nat * nat := (x_12 p, y_12 p).
Definition from_pair_12 (q : nat * nat) : point_12 := mkPoint_12 (fst q) (snd q).
Definition weight_point_12 (p : point_12) : nat := x_12 p + y_12 p.
Definition weight_pair_12 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_12 : forall p : point_12, from_pair_12 (to_pair_12 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_12 : forall q : nat * nat, to_pair_12 (from_pair_12 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_12 : forall p : point_12, weight_pair_12 (to_pair_12 p) = weight_point_12 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_012.

