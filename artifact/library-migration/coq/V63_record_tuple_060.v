(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_060.
Record point_60 := mkPoint_60 { x_60 : nat; y_60 : nat }.

Definition to_pair_60 (p : point_60) : nat * nat := (x_60 p, y_60 p).
Definition from_pair_60 (q : nat * nat) : point_60 := mkPoint_60 (fst q) (snd q).
Definition weight_point_60 (p : point_60) : nat := x_60 p + y_60 p.
Definition weight_pair_60 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_60 : forall p : point_60, from_pair_60 (to_pair_60 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_60 : forall q : nat * nat, to_pair_60 (from_pair_60 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_60 : forall p : point_60, weight_pair_60 (to_pair_60 p) = weight_point_60 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_060.

