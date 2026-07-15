(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_030.
Record point_30 := mkPoint_30 { x_30 : nat; y_30 : nat }.

Definition to_pair_30 (p : point_30) : nat * nat := (x_30 p, y_30 p).
Definition from_pair_30 (q : nat * nat) : point_30 := mkPoint_30 (fst q) (snd q).
Definition weight_point_30 (p : point_30) : nat := x_30 p + y_30 p.
Definition weight_pair_30 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_30 : forall p : point_30, from_pair_30 (to_pair_30 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_30 : forall q : nat * nat, to_pair_30 (from_pair_30 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_30 : forall p : point_30, weight_pair_30 (to_pair_30 p) = weight_point_30 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_030.

