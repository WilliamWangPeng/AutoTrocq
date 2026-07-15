(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_028.
Record point_28 := mkPoint_28 { x_28 : nat; y_28 : nat }.

Definition to_pair_28 (p : point_28) : nat * nat := (x_28 p, y_28 p).
Definition from_pair_28 (q : nat * nat) : point_28 := mkPoint_28 (fst q) (snd q).
Definition weight_point_28 (p : point_28) : nat := x_28 p + y_28 p.
Definition weight_pair_28 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_28 : forall p : point_28, from_pair_28 (to_pair_28 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_28 : forall q : nat * nat, to_pair_28 (from_pair_28 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_28 : forall p : point_28, weight_pair_28 (to_pair_28 p) = weight_point_28 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_028.

