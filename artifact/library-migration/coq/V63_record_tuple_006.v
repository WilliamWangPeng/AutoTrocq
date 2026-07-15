(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_006.
Record point_6 := mkPoint_6 { x_6 : nat; y_6 : nat }.

Definition to_pair_6 (p : point_6) : nat * nat := (x_6 p, y_6 p).
Definition from_pair_6 (q : nat * nat) : point_6 := mkPoint_6 (fst q) (snd q).
Definition weight_point_6 (p : point_6) : nat := x_6 p + y_6 p.
Definition weight_pair_6 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_6 : forall p : point_6, from_pair_6 (to_pair_6 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_6 : forall q : nat * nat, to_pair_6 (from_pair_6 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_6 : forall p : point_6, weight_pair_6 (to_pair_6 p) = weight_point_6 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_006.

