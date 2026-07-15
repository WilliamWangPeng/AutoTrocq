(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_002.
Record point_2 := mkPoint_2 { x_2 : nat; y_2 : nat }.

Definition to_pair_2 (p : point_2) : nat * nat := (x_2 p, y_2 p).
Definition from_pair_2 (q : nat * nat) : point_2 := mkPoint_2 (fst q) (snd q).
Definition weight_point_2 (p : point_2) : nat := x_2 p + y_2 p.
Definition weight_pair_2 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_2 : forall p : point_2, from_pair_2 (to_pair_2 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_2 : forall q : nat * nat, to_pair_2 (from_pair_2 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_2 : forall p : point_2, weight_pair_2 (to_pair_2 p) = weight_point_2 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_002.

