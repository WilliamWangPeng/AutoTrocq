(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_011.
Record point_11 := mkPoint_11 { x_11 : nat; y_11 : nat }.

Definition to_pair_11 (p : point_11) : nat * nat := (x_11 p, y_11 p).
Definition from_pair_11 (q : nat * nat) : point_11 := mkPoint_11 (fst q) (snd q).
Definition weight_point_11 (p : point_11) : nat := x_11 p + y_11 p.
Definition weight_pair_11 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_11 : forall p : point_11, from_pair_11 (to_pair_11 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_11 : forall q : nat * nat, to_pair_11 (from_pair_11 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_11 : forall p : point_11, weight_pair_11 (to_pair_11 p) = weight_point_11 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_011.

