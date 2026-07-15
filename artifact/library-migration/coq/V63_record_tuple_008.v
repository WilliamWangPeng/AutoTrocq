(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_008.
Record point_8 := mkPoint_8 { x_8 : nat; y_8 : nat }.

Definition to_pair_8 (p : point_8) : nat * nat := (x_8 p, y_8 p).
Definition from_pair_8 (q : nat * nat) : point_8 := mkPoint_8 (fst q) (snd q).
Definition weight_point_8 (p : point_8) : nat := x_8 p + y_8 p.
Definition weight_pair_8 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_8 : forall p : point_8, from_pair_8 (to_pair_8 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_8 : forall q : nat * nat, to_pair_8 (from_pair_8 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_8 : forall p : point_8, weight_pair_8 (to_pair_8 p) = weight_point_8 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_008.

