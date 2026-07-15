(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_004.
Record point_4 := mkPoint_4 { x_4 : nat; y_4 : nat }.

Definition to_pair_4 (p : point_4) : nat * nat := (x_4 p, y_4 p).
Definition from_pair_4 (q : nat * nat) : point_4 := mkPoint_4 (fst q) (snd q).
Definition weight_point_4 (p : point_4) : nat := x_4 p + y_4 p.
Definition weight_pair_4 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_4 : forall p : point_4, from_pair_4 (to_pair_4 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_4 : forall q : nat * nat, to_pair_4 (from_pair_4 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_4 : forall p : point_4, weight_pair_4 (to_pair_4 p) = weight_point_4 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_004.

