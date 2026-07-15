(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_015.
Record point_15 := mkPoint_15 { x_15 : nat; y_15 : nat }.

Definition to_pair_15 (p : point_15) : nat * nat := (x_15 p, y_15 p).
Definition from_pair_15 (q : nat * nat) : point_15 := mkPoint_15 (fst q) (snd q).
Definition weight_point_15 (p : point_15) : nat := x_15 p + y_15 p.
Definition weight_pair_15 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_15 : forall p : point_15, from_pair_15 (to_pair_15 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_15 : forall q : nat * nat, to_pair_15 (from_pair_15 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_15 : forall p : point_15, weight_pair_15 (to_pair_15 p) = weight_point_15 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_015.

