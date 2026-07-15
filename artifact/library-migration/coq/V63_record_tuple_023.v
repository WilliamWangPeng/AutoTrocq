(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_023.
Record point_23 := mkPoint_23 { x_23 : nat; y_23 : nat }.

Definition to_pair_23 (p : point_23) : nat * nat := (x_23 p, y_23 p).
Definition from_pair_23 (q : nat * nat) : point_23 := mkPoint_23 (fst q) (snd q).
Definition weight_point_23 (p : point_23) : nat := x_23 p + y_23 p.
Definition weight_pair_23 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_23 : forall p : point_23, from_pair_23 (to_pair_23 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_23 : forall q : nat * nat, to_pair_23 (from_pair_23 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_23 : forall p : point_23, weight_pair_23 (to_pair_23 p) = weight_point_23 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_023.

