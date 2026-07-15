(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_041.
Record point_41 := mkPoint_41 { x_41 : nat; y_41 : nat }.

Definition to_pair_41 (p : point_41) : nat * nat := (x_41 p, y_41 p).
Definition from_pair_41 (q : nat * nat) : point_41 := mkPoint_41 (fst q) (snd q).
Definition weight_point_41 (p : point_41) : nat := x_41 p + y_41 p.
Definition weight_pair_41 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_41 : forall p : point_41, from_pair_41 (to_pair_41 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_41 : forall q : nat * nat, to_pair_41 (from_pair_41 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_41 : forall p : point_41, weight_pair_41 (to_pair_41 p) = weight_point_41 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_041.

