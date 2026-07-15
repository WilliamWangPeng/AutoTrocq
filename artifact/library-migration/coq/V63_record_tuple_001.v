(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_001.
Record point_1 := mkPoint_1 { x_1 : nat; y_1 : nat }.

Definition to_pair_1 (p : point_1) : nat * nat := (x_1 p, y_1 p).
Definition from_pair_1 (q : nat * nat) : point_1 := mkPoint_1 (fst q) (snd q).
Definition weight_point_1 (p : point_1) : nat := x_1 p + y_1 p.
Definition weight_pair_1 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_1 : forall p : point_1, from_pair_1 (to_pair_1 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_1 : forall q : nat * nat, to_pair_1 (from_pair_1 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_1 : forall p : point_1, weight_pair_1 (to_pair_1 p) = weight_point_1 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_001.

