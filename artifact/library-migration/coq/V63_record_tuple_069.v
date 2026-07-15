(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_069.
Record point_69 := mkPoint_69 { x_69 : nat; y_69 : nat }.

Definition to_pair_69 (p : point_69) : nat * nat := (x_69 p, y_69 p).
Definition from_pair_69 (q : nat * nat) : point_69 := mkPoint_69 (fst q) (snd q).
Definition weight_point_69 (p : point_69) : nat := x_69 p + y_69 p.
Definition weight_pair_69 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_69 : forall p : point_69, from_pair_69 (to_pair_69 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_69 : forall q : nat * nat, to_pair_69 (from_pair_69 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_69 : forall p : point_69, weight_pair_69 (to_pair_69 p) = weight_point_69 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_069.

