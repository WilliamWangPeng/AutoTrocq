(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_070.
Record point_70 := mkPoint_70 { x_70 : nat; y_70 : nat }.

Definition to_pair_70 (p : point_70) : nat * nat := (x_70 p, y_70 p).
Definition from_pair_70 (q : nat * nat) : point_70 := mkPoint_70 (fst q) (snd q).
Definition weight_point_70 (p : point_70) : nat := x_70 p + y_70 p.
Definition weight_pair_70 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_70 : forall p : point_70, from_pair_70 (to_pair_70 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_70 : forall q : nat * nat, to_pair_70 (from_pair_70 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_70 : forall p : point_70, weight_pair_70 (to_pair_70 p) = weight_point_70 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_070.

