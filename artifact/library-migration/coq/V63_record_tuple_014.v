(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_014.
Record point_14 := mkPoint_14 { x_14 : nat; y_14 : nat }.

Definition to_pair_14 (p : point_14) : nat * nat := (x_14 p, y_14 p).
Definition from_pair_14 (q : nat * nat) : point_14 := mkPoint_14 (fst q) (snd q).
Definition weight_point_14 (p : point_14) : nat := x_14 p + y_14 p.
Definition weight_pair_14 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_14 : forall p : point_14, from_pair_14 (to_pair_14 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_14 : forall q : nat * nat, to_pair_14 (from_pair_14 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_14 : forall p : point_14, weight_pair_14 (to_pair_14 p) = weight_point_14 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_014.

