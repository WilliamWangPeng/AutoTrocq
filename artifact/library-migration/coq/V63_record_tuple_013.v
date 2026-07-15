(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_013.
Record point_13 := mkPoint_13 { x_13 : nat; y_13 : nat }.

Definition to_pair_13 (p : point_13) : nat * nat := (x_13 p, y_13 p).
Definition from_pair_13 (q : nat * nat) : point_13 := mkPoint_13 (fst q) (snd q).
Definition weight_point_13 (p : point_13) : nat := x_13 p + y_13 p.
Definition weight_pair_13 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_13 : forall p : point_13, from_pair_13 (to_pair_13 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_13 : forall q : nat * nat, to_pair_13 (from_pair_13 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_13 : forall p : point_13, weight_pair_13 (to_pair_13 p) = weight_point_13 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_013.

